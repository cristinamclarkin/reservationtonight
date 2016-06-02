
"""Flask server for ReservationTonight!"""

from jinja2 import StrictUndefined
from flask import Flask, render_template, request, redirect, flash, session, url_for
from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined
from model import connect_to_db, db, Restaurant, Reservation, User, Category, RestaurantCategory
from yelpapi import YelpAPI
from yelp_api import filter_by_category
from werkzeug.contrib.cache import SimpleCache
cache = SimpleCache()
from datetime import datetime, timedelta
from threading import Timer
from time import sleep
#from google_api import BROWSER_KEY





# FLASK APP #
app = Flask(__name__)

# Required to use Flask sessions and the debug toolbar
app.secret_key = "Mysecret"

# Raises an error an undefined variable in Jinja2 is used
app.jinja_env.undefined = StrictUndefined


@app.route("/")
def index():
    """Homepage."""

    return render_template("home_page.html")


@app.route('/user_register', methods=['GET'])
def user_register_form():
    """Show form for user signup."""
    print "user_register"
    return render_template("user_register_form.html")


@app.route('/user_register', methods=['POST'])
def process_registration():
    """Process registration."""

    # Get form variables
    email = request.form["email"]
    password = request.form["password"]
    user_telephone= request.form["user_telephone"]

    new_user = User(email=email, password=password, user_telephone=user_telephone)

    db.session.add(new_user)
    db.session.commit()

    flash("User %s added." % email)
    return redirect("/")


@app.route('/user_login', methods=['GET'])
def login_form():
    """Show login form."""

    return render_template("user_login_form.html")


@app.route('/user_login', methods=['POST'])
def login_process():
    """Process login."""

    # Get form variables
    # email = request.form["email"]
    # password = request.form["password"]

    # email = request.form.get('email')
    # password = request.form.get('password')

    # # gets a user object from the database by email
    # user = db.session.query(User).filter(User.email == email).first()

    # # handles login of existing user
    # if user:
    #     if password == user.password:
    #         # flash message
    #         # return render_template("homepage.html")
    #         # add username to session
    #         flash("Successfully logged in.")
    #         session["user_id"] = user.user_id
    #         session["login_time"] = datetime.utcnow();
    #         session['logged_in_email'] = user.email
    #         #session['logged_in_user_id'] = db_user.user_id
    
    #         return redirect("/index/"+str(user.user_id))

    # elif not user:
    #     flash("No such user")
    #     return redirect("/user_login")

    # elif user.password != password:
    #     flash("Incorrect password")
    #     return redirect("/user_login")

    email = request.form.get("email")
    password = request.form.get("password")

    user = User.query.filter_by(email=email).first()

    if not user:
        flash("No such user")
        return redirect("/user_login")

    if user.password != password:
        flash("Incorrect password")
        return redirect("/user_login")

    session["user_id"] = user.user_id
    session["email"]= user.email
    session["login_time"] = datetime.utcnow();

    flash("You are now logged in")
    return redirect(url_for("index", user=user, email=user.email, user_id=user.user_id))



    


@app.route('/user_logout')
def logout():
    """Log out."""

    del session["user_id"]
    flash("Logged Out.")
    return redirect("/")


@app.route("/users/<int:user_id>")
def user_detail(user, user_id):
    """Show info about user."""

    user = User.query.filter_by(email=email).first()
    user_id = session["user_id"]
    return render_template("user_info.html", user=user, user_id=user_id)


@app.route('/restaurant_login', methods=['GET'])
def restaurant_login():
    """Renders registration_form."""

    return render_template("restaurant_login_form.html")


@app.route('/restaurant_login', methods=['POST'])
def process_restaurant_login():
    """Renders registration_form."""

    restaurant_name = request.form["restaurant_name"]

    restaurant = Restaurant.query.filter_by(restaurant_name=restaurant_name).first()

    if not restaurant:
        flash("Sorry! That restaurant name does not match anything in our records.")
        return redirect('/')
    else:
        session['id'] = restaurant.id
        return redirect('/new_reservation/'+ str(restaurant.id))


@app.route('/new_reservation/<int:restaurant_id>', methods=['GET'])
def new_reservation(restaurant_id):
    """renders new reservation form"""
    print restaurant_id
    return render_template("new_reservation_form.html", restaurant_id=restaurant_id)


@app.route('/new_reservation/<int:restaurant_id>', methods=['POST'])
def process_new_reservation(restaurant_id):
    """processes new reservation slot."""


    timestamp = request.form["timestamp"]
    print timestamp
    party_size = request.form["party_size"]
    reservation_status = "Open"
    
    # reservation_status = request.form["reservation_status"]
    new_reservation = Reservation(timestamp=timestamp, party_size=party_size, reservation_status=reservation_status, restaurant_id=restaurant_id)


    db.session.add(new_reservation)
    db.session.commit()

    flash("Reservation %s added." % new_reservation)
    #would like to have something that asks. Make another reservation?
    return redirect("/")
    

# @app.route('/search', methods=['GET'])
# def user_search():
#     """renders user search form"""

#     user_id = session.get("user_id")
#     if not user_id:
#         raise Exception("No user logged in.")

#     return render_template("search_form.html")


@app.route('/search', methods=['GET'])
def process_user_search():
    """processes user search form""" 
    
    #grabs user form inputs

    user_party_size = request.args.get("party_size")
    user_timestamp = request.args.get("timestamp")
    category_name = request.args.get("cuisines")
    #queries Category to macth category_name to category_d
    category_id = db.session.query(Category).filter_by(category_name=category_name).one().id
    
    
    open_reservations = db.session.query(Reservation).filter_by(reservation_status="Open", timestamp=user_timestamp, party_size=user_party_size).all()

    matching_reservations = []
    
    #returns a list of reservation objects in the form [{Id:1,restaurant_id:1, user_id:23, timestamp:5 pm, partysize: 2}...]
    for reservation in open_reservations:
        # print(vars(reservation))
        #returns rows in reservation_categories table where restaurant id matches reservation.restaurant_id
        rest_cat_id= db.session.query(RestaurantCategory).filter_by(restaurant_id=reservation.restaurant_id).first().category_id
        print(vars(reservation))
        if rest_cat_id == category_id:
            matching_reservations.append(reservation)
    
    user_id = session["user_id"]
    
    print matching_reservations
    print(user_party_size)
    
    rest_info_list = []
    for reservation in matching_reservations:
        rest_id = reservation.restaurant_id
        restaurant_info = db.session.query(Restaurant).filter_by(id=rest_id).one()
        restaurant_info.reservation_id = reservation.id
        rest_info_list.append(restaurant_info)

    

    return render_template("search_results_form.html", user_party_size=user_party_size, matching_reservations=matching_reservations,
                            user_timestamp=user_timestamp, category_name=category_name, category_id=category_id, rest_info_list=rest_info_list, user_id=user_id)



@app.route('/reserve/<int:reservation_id>', methods=['POST'])
def reserve_time(reservation_id):
    """Find the restaurant by restaurant id, change reservation_status to False, update in db"""
    restaurant_to_reserve = db.session.query(Reservation).filter_by(id=reservation_id).update({'reservation_status':"Reserved"})
    print reservation_id
    db.session.commit()

    print "added reservation"
    return redirect('/')

@app.route('/save/<int:reservation_id>', methods=['POST'])
def hold_reservation(reservation_id):
    user_id = session['user_id']
    """Allows user to reserve restaurant timeslot for 5 minutes"""
    saved = datetime.utcnow() 
    saved_plus_1 = saved + timedelta(minutes = 1)

    db.session.query(Reservation).filter_by(id=reservation_id)\
    .update({'reservation_status':'Pending', 'user_id': user_id, 'saved_expires': saved_plus_1})
    print("result ", user_id, saved_plus_1)
    db.session.commit()
    t = Timer((30), change_status, [reservation_id])
    t.start()
    # stuck HERE for 5 minutes 
    return ('', 204)



########################Helper fiunctions##################

def change_status(reservation_id):
    """change the reservation status back to open saved_expires"""

    db.session.query(Reservation).filter_by(id=reservation_id)\
    .update({ 'reservation_status': 'Open', 'user_id': None})
    db.session.commit()
    







# def get_bookmark():
#     rv = cache.get('reservation_id')
#     if rv is None:
#         rv = calculate_value()
#         cache.set('reservarion', rv, timeout=5 * 60)
#     return rv




if __name__ == "__main__":
    app.debug = True

    connect_to_db(app)

    DebugToolbarExtension(app)

    DEBUG_TB_INTERCEPT_REDIRECTS = False

    app.run()

