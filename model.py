from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import time

db = SQLAlchemy()
##############################################################################
# DB Models



class Restaurant(db.Model):
    __tablename__ = "restaurants"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    yelp_id = db.Column(db.String(50), unique=True, nullable=True)
    restaurant_name = db.Column(db.String(50), nullable=True)
    address_line_1 = db.Column(db.String(30), nullable=True)
    address_line_2 = db.Column(db.String(30), nullable=True)
    city = db.Column(db.String(30), nullable=True)
    zipcode = db.Column(db.String(5), nullable=True)
    telephone = db.Column(db.String(15), nullable=True)
    latitude = db.Column(db.Float, nullable=True)
    longitude = db.Column(db.Float, nullable=True)
    yelp_url = db.Column(db.String(200), nullable=True)
    yelp_rating = db.Column(db.Float, nullable=True)
    yelp_reviews = db.Column(db.Integer, nullable=True)

    categories = db.relationship("Category", secondary="restaurant_categories", backref="restaurants")

    # def __repr__(self):
    #     """Show info about a restaurant."""

    #     return "<Restaurant id=%s restaurant_name=%s telephone=%s yelp_url=%s>" % (
    #         self.id, self.restaurant_name, self.telephone, self.yelp_url)

class Category(db.Model):
    __tablename__ = "categories"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    category_name =db.Column(db.String(40), nullable=True)

    # def __repr__(self):
    #     """Show info about a restaurant."""

    #     return "<Category id=%s category_name=%s >" % (
    #         self.id, self.category_name)


class RestaurantCategory(db.Model):
    __tablename__ = "restaurant_categories"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'), nullable=False)
    restaurant_id = db.Column(db.Integer, db.ForeignKey('restaurants.id'), nullable=False)

    # def __repr__(self):
    #     """Show info about a restaurant."""

    #     return "<Category id=%s category_id=%s restaurant_id%s>" % (
    #         self.id, self.category_id, self.restaurant_id)



class Reservation(db.Model):
    __tablename__ = "reservations"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    restaurant_id = db.Column(db.Integer, db.ForeignKey('restaurants.id'),nullable=False)
    user_id= db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=True)
    timestamp = db.Column(db.String(10), nullable=False)
    party_size = db.Column(db.Integer, nullable=False)
    reservation_status = db.Column(db.String(15), nullable=False)
    saved_expires = db.Column(db.DateTime, default=datetime.utcnow, nullable=True)
    
    restaurant = db.relationship('Restaurant', backref='reservations')
    user = db.relationship  ('User', backref='reservations')

    # def __repr__(self):
    #     """Show info about a restaurant."""

    #     return "<Category id=%s category_id=%s restaurant_id%s>" % (
    #         self.id, self.restaurant_id, self.user_id, self.restaurant_timestamp, self.party_size, self.reservation_status)


class User(db.Model):
    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    email = db.Column(db.String(30), unique=True, nullable=False)
    password = db.Column(db.String(15), nullable=False)
    user_telephone = db.Column(db.String(100), nullable=True)

    # def __repr__(self):
    #     """Show info about a restaurant."""

    #     return "<Category id=%s category_id=%s restaurant_id%s>" % (
    #         self.id, self.email, self.password, self.user_telephone)

    








##############################################################################
# Helper functions


def init_app():
    from flask import Flask
    app = Flask(__name__)
    connect_to_db(app)
    print "Connected to DB."

def connect_to_db(app, db_uri='postgresql:///reservationtonight'):
    """Connect database to Flask app."""

    # Configure to use PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    app.config['SQLAlCHEMY_ECHO'] = True
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)

    db.create_all()

if __name__ == "__main__":
    # if run interactively, this will allow access of the db
    from flask import Flask

    app = Flask(__name__)

    connect_to_db(app)
    print "Connected to DB."