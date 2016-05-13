import json

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















