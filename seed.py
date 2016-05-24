from sqlalchemy import func
from flask import session

from datetime import datetime 
from model import connect_to_db, db, Restaurant, Reservation, User, Category, RestaurantCategory
from yelp_api import filter_by_category


def load_users():
    """Load new users to db."""

    print "Users"
    # email = 'cristinamclarkin@gmail.com'
    # password = 'lovesdogs'
    # user_telephone = 2018871119


    new_user = User(email=email, password=password, user_telephone=user_telephone)

    # Add session to store it.
    db.session.add(new_user)

    db.session.commit()


def load_restaurants(results):
    """Queries yelp for each cuisine and for each restaurant, write
    restaurant to db."""

    print "Restaurants"

    output = open('cuisines.txt', 'a')

    for business in results["businesses"]:
        yelp_id = business["id"]
        restaurant_name = business.get("name", '')
        address_line_1 = business["location"]["display_address"][0]
        address_line_2 =business["location"]["display_address"][1]
        city = business["location"]["city"]
        zipcode = business["location"].get("postal_code", '')
        latitude = business['location']["coordinate"]["latitude"]
        longitude =business['location']["coordinate"]["longitude"]
        yelp_url = business["url"]
        telephone = business.get("phone", '')

        #business_categories = get_categories(business["categories"])

        new_restaurant = Restaurant(restaurant_name=restaurant_name, 
                                    address_line_1=address_line_1, 
                                    address_line_2=address_line_2,
                                    city=city,
                                    zipcode=zipcode,
                                    telephone=telephone,
                                    latitude=latitude,
                                    longitude=longitude,
                                    yelp_url=yelp_url)
                                    


        db.session.add(new_restaurant)

        db.session.commit()

        for category in business['categories']:
            print "This is the " + category[1]
            category_string =category[1]
            category_object = Category.query.filter_by(category_name=category_string).first()
            # print new_restaurant
            print category_object
            if category_object:
                load_restaurantcategories(new_restaurant.id, category_object.id)




    #     line = str(new_restaurant.restaurant_id) + '|' + yelp_id + '|' + restaurant_name + '|' + unicode(business['categories'])    
        
    #     output.write(line.encode('utf8') + '\n')

    # output.close()



# def load_restaurantcategories(restaurant_object, list_categories):
# """takes a restaurant and categories that describe that restaurant and writes that to db"""
#     for category in list_categories:
#         new_business_category = Restaurantcategory(restaurant_id=restaurant_object.restaurant_id, 
#                                                    category_id=category.category_id)
#         db.add.session(new_business_category)
#     db.session.commit()


def load_categories(list_categories):
    """ takes list of categories, adds each one to db and returns a list of all categories """
    category_list = []
    for category in list_categories:
        new_category = Category(category_name=category)
        category_list.append(new_category)
        db.session.add(new_category)
    db.session.commit()

    return category_list
   
        

def load_reservations():
    """Load reservations."""

    print "Reservations"
    # timestamp = 12 pm
    # party_size = 2



    reservation = Reservation(timestamp=timestamp, party_size=party_size, restaurant_id=restaurant_id, reservation_status=reservation_status)

    # Add session to store it
    db.session.add(reservation)

    # provides some sense of progress.
    if i % 1000 == 0:
        print i

        # An optimization: Commits 1,000th
        # add.
        db.session.commit()

    # Commits previous work.
    db.session.commit()


# def get_category(category_string):

#     return Category.query.filter_by(category_name=category_string).one()

def load_restaurantcategories(restaurant_id,category_id):
    """takes a restaurant id and category id writes it to db"""
    new_business_category = RestaurantCategory(restaurant_id=restaurant_id, 
                                                   category_id=category_id)
    db.session.add(new_business_category)
    db.session.commit()

    






if __name__ == "__main__":
    from server import app
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()



    # Import different types of data
    cuisines_list = ['mexican', 'italian', 'chinese', 'french', 'korean', 'japanese', 'indpak', 'ethiopian' ]
    load_categories(cuisines_list)
    
    # load_users()
    # load_reservations()
    # set_val_user_id()
    # cuisines = read_json_categories() 

    for cuisine in cuisines_list:
        results = filter_by_category(cuisine)
        load_restaurants(results)