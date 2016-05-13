from sqlalchemy import func

from datetime import datetime 
from model import connect_to_db, db
from yelp_api import filter_by_category, read_json_categories



def load_users():
    """Load new users to db."""

    print "Users"


    user = User(email=email,
                password=password,
                user_telephone=user_telephone)

    # Add session to store it.
    db.session.add(user)

    db.session.commit()


def load_restaurants(results):
    """Load restaurants from yelp API into database."""

    print "Restaurants"

    for business in results["businesses"]:
        yelp_id = business["id"]
        restaurant_name = business["name"]
        address_line_1 = business["location"]["display address"][0]
        address_line_2 =business["location"]["display address"][1]
        city = business["location"]["city"]
        zipcode = business["location"]["postal code"]
        latitude = business["coordinate"]["latitude"]
        longitude =business["coordinate"]["longitude"]
        yelp_url = business["url"]
        telephone = business["phone"]

        business_categories = load_categories(business["categories"])

        new_restaurant = Restaurant(name=name, 
                      address=address, 
                      yelp_url=yelp_url) 


        db.session.add(new_restaurant)

        db.session.commit()

        load_restaurantcategories(new_restaurant, business_categories)


def load_restaurantcategories(restaurant_object, list_categories):

    for category in list_categories:
        new_business_category = Restaurantcategory(restaurant_id=restaurant_object.restaurant_id, 
                                                   category_id=category.category_id)
        db.add.session(new_business_category)
    db.session.commit()


def load_categories(list_categories):
    """ takes list of categories, adds each one to db and returns a list of all c """
    category_list = []
    for category in list_categories:
        new_category = Category(category_name=category[0])
        category_list.append(new_category)
        db.session.add(new_category)
    db.session.commit()

    return category_list
   
        

def load_reservations():
    """Load reservations."""

    print "Reservations"




    reservation = Reservation(timestamp=timestamp, party_size=party_size)

    # Add session to store it
    db.session.add(rating)

    # provide some sense of progress
    if i % 1000 == 0:
        print i

        # An optimization: Commits 1,000th
        # add.
        db.session.commit()

    # Once we're done, we should commit our work
    db.session.commit()




if __name__ == "__main__":
    from server import app
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_users()
    load_reservations()
    set_val_user_id()
    cuisines = read_json_categories() 
    filter_by_category(cuisines)