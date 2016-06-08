# Reservations Tonight
Surprise! Your parents are driving into the city for dinner tonight. Your pots and pans have never been removed from their original packaging and you need reservations. Fast! Don't leave your evening to chance. Reservations Tonight allows you to find available tables at restaurants near you.Using restaurant data drawn from Yelp's API, you can search Reservation Tonight's database of available reservations by party size, location, desired time, cuisine, restaurant rating and more. Reservation search results are plotted on a Google Map, and reservation confirmation texts are sent via Twilio. Bookmark reservations you find appealing or reserve immediately to lock in a reservation that will appease even the most judgmental of mothers.

## Technologies Used
* Python
* Flask
* PostgreSQL
* SQLAlchemy
* JavaScript
* jQuery
* Jinja2
* Bootstrap
* HTML/CSS
* Yelp API
* Google Maps API
* Twilio API
* Multithreading 

## How Reservations Tonight Works:

###Restaurant Sign In
Restaurants log in and add available reservations. Available reservations are then stored in the database. 

### User Search
Users can register, sign in, and search by party size, cuisine, and desired reservation tonight time.
<img src="/static/images/home_page.gif" alt="Reservations Tonight">

### Results
To minimize latency, restaurant information is drawn from Yelp's API and stored in Reservation Tonight's database. The browser receives the response from the server and renders a map and list of restaurants matching the user's criteria. Users can scroll through the list to dynamically render a marker at the restaurant's location on the map. Users can weigh the factors of ratings, reviews and proximity to choose a restaurant.  
<img src="/static/img/search_results.gif" alt="Results">

#### Sort and Filter
For more tailored results, users can sort by highest Yelp rating and most reviews, and filter by neighborhood. The list of available neighborhoods is dynamic and dependent upon the results returned.
<img src="/static/img/sort_filter.gif" alt="Sort and Filter">

### Reserving and Saving 
Often, there is an intermediary step between reserving and confirming on booking sites. To address this logistical concern, users can opt to either reserve an open reservation now or save a reservation for up to 15 minutes. Saving is handled using the timer module imported from the Python threading library. Saving a reservation changes the status of the reservation in the database to 'pending' and temporarily removes it from view. This prevents the reservation from being returned in another user's search. If a user decides to reserve that particular reservation before the alloted time has expired, she can do so from the user information page, which logs all user activity, past and present.
<img src="/static/img/reserve_save.gif" alt="Report">

### Text Reminder
After reserving a table, users can enter their phone number to receive text notifications for reminders with the reservation time and location. 


## Version 2.0
* Implement Chart.js to visualize reservation heatmap
* Add a machine learning component to render a list of restaurants tailored by 
past selections 

## Author
Cristina Clarkin
https://www.linkedin.com/in/cristina-clarkin