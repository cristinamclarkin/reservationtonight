from server import app
from unittest import TestCase
import unittest
from model import connect_to_db, db, Restaurant, Reservation, User, Category, RestaurantCategory

class FlaskTests(TestCase):

    def setUp(self):
        """Stuff to do before every test."""

        self.client = app.test_client()
        app.config['TESTING'] = True
        result = self.client.get("/my-route")

        connect_to_db(app, "postgresql:///reservationtonight")
        db.create_all()


    def tearDown(self):
        """Stuff to do after each test."""

    def test_homepage(self):
        result = self.client.get("/")
        self.assertIn('<h1 id="home-header" class="header-text">Reservations Tonight</h1>', result.data)

    def _login(self):
        result = self.client.post('/user_login',
                                    data= {'email': 'josephjsass@gmail.com', 'password': '123'},
                                    follow_redirects=True)

    def test_search(self):
        self._login()
        result = self.client.get("/search?party_size=2&cuisines=mexican&timestamp=5 pm",
                                  follow_redirects=True)
        self.assertIn("Search for Open Reservations", result.data)
        self.assertNotIn("Reservations Tonight", result.data)   
        self.assertEqual(result.status_code, 200)


    def test_search_with_sort(self):
        self._login()
        result = self.client.get("/search?party_size=2&cuisines=mexican&timestamp=5 pm&sort=rating",
                                  follow_redirects=True)
        self.assertIn("Search for Open Reservations", result.data)
        self.assertNotIn("Reservations Tonight", result.data)

    def test_search_with_filter(self):
        self._login()
        result = self.client.get("/search?party_size=2&cuisines=mexican&timestamp=5 pm&filter_by_neighborhood=Financial+District",
                                  follow_redirects=True)
        self.assertIn("Search for Open Reservations", result.data)
        self.assertNotIn("Reservations Tonight", result.data)     


    def test_search_party_too_large(self):
        self._login()
        result = self.client.get("/search?party_size=200000&cuisines=mexican&timestamp=5 pm&filter_by_neighborhood=Financial+District",
                                  follow_redirects=True)
        self.assertIn('No results found', result.data)     



    # def test1(self):
    #   """Some test..."""
    #   self.assertIn('<h1>Test</h1>', result.data)

    # def test2(self):
    #   """Some other test"""
    #   self.assertIn('<h1>Test</h1>', result.data)

if __name__ == "__main__":
    unittest.main()