import os
from yelpapi import YelpAPI
import pprint



CONSUMER_KEY = os.environ['CONSUMER_KEY']
CONSUMER_SECRET = os.environ['CONSUMER_SECRET']
TOKEN = os.environ['TOKEN']
TOKEN_SECRET = os.environ['TOKEN_SECRET']



location = "location=San+Francisco,CA,USA"
term = "term=tacos"
limit = 10

yelp_api = YelpAPI(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, TOKEN_SECRET)
search_results = yelp_api.search_query(location=location, term=term, limit=limit)
printer = pprint.PrettyPrinter()
printer.pprint(search_results)
