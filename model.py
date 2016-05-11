from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
##############################################################################
# DB Models



class Restaurant(db.Model):
    __tablename__ = "restaurants"

    restaurant_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    yelp_id = db.Column(db.String, unique=True)
    restaurant_name = db.Column(db.String(50), nullable=False)
    address_line_1 = db.Column(db.String(30), nullable=False)
    address_line_2 = db.Column(db.String(30), nullable=True)
    city = db.Column(db.String(30), nullable=False)
    zipcode = db.Column(db.String(5), nullable=False)
    telephone = db.Column(db.String(15), nullable=False)
    latitude = db.Column(db.Float, nullable=False)
    longitude = db.Column(db.Float, nullable=False)
    restaurant_url = db.Column(db.String(40), nullable=True)


class Reservation(db.Model):
    __tablename__ = "reservations"

    rervation_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    restaurant_id = db.Column(db.Integer, foreign_key=True)
    ***user_id= db.Column(db.Integer, foreign_key=True, nullable=True)
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)
    party_size = db.Column(db.)
    status =


class User(db.Model):
    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    email = db.Column(db.String(30), unique=True, nullable=False)
    password = db.Column(db.String(15), nullable=False)
    password = db.Column(db.String(15), nullable=False)
    user_telephone = db.Column(db.String(100), nullable=True)









##############################################################################
# Helper functions

def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PstgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///haven'
    db.app = app
    db.init_app(app)


if __name__ == "__main__":
    # if run interactively, this will allow access of the db

    from server import app
    connect_to_db(app)
    print "Connected to DB."