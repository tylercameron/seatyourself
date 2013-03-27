# SeatYourself

An OpenTable clone written by @jbintodotca and @ashbt in Rails.

# Roadmap

## v0.1

* First version will have very basic customer-oriented listing and reservation features.

## v0.2 and beyond

* Reviews
* Owner content curation
* Multiple categories
* Featured restaurants -> custom algorithm 
* Reserve right now -> top featured available restaurant 
* I'm feeling lucky	-> random reservation
* Email reminder to user
* Email confirmation to restaurant
* Mapping integration
* SeatYourself score
* User's custom preferences by category

## v0.3 and beyond

* Identify loyal / valuable customers

# Notes

We will have the following models:

* User
* Restaurant
* Category
* Timeslot
* Reservation

# User experience

## Prioritize for time

One user might be very busy and not too picky. They would enter a time range (e.g. 7 to 9) and the service would return a list of restaurants with open timeslots over that time.

## Prioritize for category

Another user has lots of free time, but only likes Italian food and likes trying new places. They'll select a category, and pick any restaurant that jumps out to them. 

## Prioritize for restaurant

Another user has been trying to get into a hot restaurant for weeks, and they're only interested in that restaurant. They don't care what time, but they want to get in at any cost. They'll be watching that restaurant page closely.

## Prioritize for discovery

Someone else is just playing around and has no preferences. They want to browse. They're a mix of category and restaurant. They can browse the pages. Perhaps we'd have some sort of "featured restaurant" either because of popularity, availability, or promotion.


# Features for v0.1

## Must haves

* Sign up
* Sign in / sign out
* List of restaurants
* List of categories
* Restaurant show page

## Nice to haves

* Make reservation directly with restaurant
* Search by timeslot for avaialable restaurants
