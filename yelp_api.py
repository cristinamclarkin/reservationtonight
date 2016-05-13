import os
from yelpapi import YelpAPI

from pprint import pprint
from cuisines import CUISINES

import json

CONSUMER_KEY = os.environ['CONSUMER_KEY']
CONSUMER_SECRET = os.environ['CONSUMER_SECRET']
TOKEN = os.environ['TOKEN']
TOKEN_SECRET = os.environ['TOKEN_SECRET']


# def get_search_parameters(category_filter):
 
#   params = {}
#   params["category_filter"] = category_filter
#   params["location"]= "San Francisco,CA,USA"
#   params["limit"] = "100"

#   return params


yelp_api = YelpAPI(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, TOKEN_SECRET)

def read_json_categories():
    json_rest_file = open("categories.json", "r")
    json_rest_data = json_rest_file.read()

    processed_rest_data = json.loads(json_rest_data)

    #print processed_rest_data[0]

    restaurants = []

    for restaurant in processed_rest_data:
      if "restaurants" in restaurant["parents"]:
          restaurants.append(restaurant["alias"])

    print restaurants


    restaurant_categories = json.dumps(restaurants)
    json_category_file = open("categories", "w")
    json_category_file.write(restaurant_categories)


    return restaurant_categories


def filter_by_category(cuisines):
    f = open('sample.json', 'w')

    for cuisine in cuisines[0:19]:
    # params = get_search_parameters(cuisine)
        print cuisine

    try:
        print "trying %s....." % cuisine
        results = yelp_api.search_query(category_filter=cuisine, location="San Francisco, CA", limit=10)



        results_string = json.dumps(results, indent=4)

        f.write(results_string+'\n')
        load_restaurants(results)
        print "%s worked!" % cuisine

    except Exception, e:
        print cuisine, 'failed'
        print "error msg is:\n\n %s" % e
    print "\n\n\n"

    f.close()




