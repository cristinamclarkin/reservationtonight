
"""Twilio API set up and text messaging"""

import os
import twilio
from twilio.rest import TwilioRestClient



ACCOUNT_SID = os.environ['TWILIO_ACCOUNT_SID']
AUTH_TOKEN = os.environ['TWILIO_AUTH_TOKEN']
TWILIO_NUMBER = os.environ['TWILIO_NUMBER']

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)


def send_reminder_sms(phone_number, restaurant_name):
    """Sends reminder sms to the user upon reserving time slot."""

    body = ("Thanks for booking with %s."
            "This is to confirm your reservation tonight at %s."
            "Please remember to arrive within 15 minutes of your reservation time"
            "and to call %s directly should you wish to cancel.") % (restaurant.restaurant_name, reservation.timestamp)

    try:
        client.messages.create(to=user_telephone,
                               from_=TWILIO_NUMBER,
                               body=body)

    except twilio.TwilioRestException as e:
        print e
        return "Error"

