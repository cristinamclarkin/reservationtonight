import os
from yelpapi import YelpAPI

from pprint import pprint
from cuisines import CUISINES

import json

CONSUMER_KEY = os.environ['CONSUMER_KEY']
CONSUMER_SECRET = os.environ['CONSUMER_SECRET']
TOKEN = os.environ['TOKEN']
TOKEN_SECRET = os.environ['TOKEN_SECRET']


def get_search_parameters(category_filter):
 
  params = {}
  params["category_filter"] = category_filter
  params["location"]= "San Francisco,CA,USA"
  params["limit"] = "100"

  return params






yelp_api = YelpAPI(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, TOKEN_SECRET)

# for alias in 
# search_results = yelp_api.search_query(get_search_parameters("category_filter"))
# printer = pprint.PrettyPrinter()
# printer.pprint(search_results)

#   request = session.get("http://api.yelp.com/v2/search",params=params)
   
#   #Transforms the JSON API response into a Python dictionary
#   data = request.json()
#   session.close()
   
#   return data



f = open('sample.json', 'w')

for cuisine in CUISINES[1:4]:
    # params = get_search_parameters(cuisine)
    print cuisine

    try:
        print "trying %s....." % cuisine
        results = yelp_api.search_query(category_filter=cuisine, location="San Francisco, CA", limit=10)


        results_string = json.dumps(results, indent=4)

        f.write(results_string+'\n')
        print "%s worked!" % cuisine

    except Exception, e:
        print cuisine, 'failed'
        print "error msg is:\n\n %s" % e
    print "\n\n\n"

f.close()
