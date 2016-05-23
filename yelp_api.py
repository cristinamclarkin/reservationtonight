import os
from yelpapi import YelpAPI
from pprint import pprint
from cuisines import CUISINES
import json





try:
    CONSUMER_KEY = os.environ['CONSUMER_KEY']
    CONSUMER_SECRET = os.environ['CONSUMER_SECRET']
    TOKEN = os.environ['TOKEN']
    TOKEN_SECRET = os.environ['TOKEN_SECRET']    
except KeyError:
    print "\n\nSECRETS NOT FOUND. SOURCE THEM.\n\n"



yelp_api = YelpAPI(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, TOKEN_SECRET)

# def read_json_categories():
#     """creates a list of cuisines supported by yelp API. E.g. ["Asian Fusion","Chinese", "Mexican"]
#     List is held in cuisines.py"""
    
#     json_rest_file = open("categories.json", "r")
#     json_rest_data = json_rest_file.read()

#     processed_rest_data = json.loads(json_rest_data)

#     #print processed_rest_data[0]

#     restaurants = []

#     for restaurant in processed_rest_data:
#       if "restaurants" in restaurant["parents"]:
#           restaurants.append(restaurant["alias"])

#     print restaurants


#     restaurant_categories = json.dumps(restaurants)
#     json_category_file = open("categories", "w")
#     json_category_file.write(restaurant_categories)


#     return restaurant_categories


def filter_by_category(user_cuisine):
    # f = open('sample.json', 'w')

    # for category in processed_rest_data:
    #     if "restaurants" in restaurant["parents"]:

    # f = open('sample.json', 'r')
    # contents = f.read()
    # return json.loads(contents)

    # for cuisine in cuisines:
    # # params = get_search_parameters(cuisine)
    #     print cuisine
    yelp_api = YelpAPI(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, TOKEN_SECRET)

    try:
        print "trying %s....." % user_cuisine
        results = yelp_api.search_query(category_filter=user_cuisine, location="San Francisco, CA", limit=20)



        # results_string = json.dumps(results, indent=4)

        # f.write(results_string+'\n')
        # load_restaurants(results)
        print "%s worked!" % user_cuisine
        return results 
        

    except Exception, e:
        print user_cuisine, 'failed'
        print "error msg is:\n\n %s" % e
    print "\n\n\n"



