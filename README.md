MakersBnB
========
```
o(=(=(=(=)=)=)=)o
 !!!!!!}!{!!!!!!                                                ___
 !!!!!} | {!!!!!                                               /   \
 !!!!}  |  {!!!!     _!_     ()              ()     _!_       | //  |
 !!!'   |   '!!!    |~@~|    ||______________||    |~@~|      |     |
 ~@~----+----~@~    |___|    |                |    |___|       \___/
 !!!    |    !!!      |      |      ~@@~      |      |       _________
 !!!    |    !!!     ( )     |_______  _______|     ( )     |____-____|
 !!!____|____!!!  __(___)__  {__~@~__}{__~@~__}  __(___)__  |____-____|
 !!!=========!!!   |__-__|   %%%%%%%%%%%%%%%%%%   |__-__|   |____-____|
_!!!_________!!!___|_____|_ %%%%%%%%%%%%%%%%%%%% _|_____|___|____-____|_
                   |     | %%%%%%%%%%%%%%%%%%%%%% |     |   |/       \|
                          %%%%%%%%%%%%%%%%%%%%%%%%
                         %%%%%%%%%%%%%%%%%%%%%%%%%%
                        %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                       /!!!!!!!!!!!!!!!!!!!!!!!!!!!!\
                       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
                       !!!!!!!!!!!!!!!!!!!!!!!!!!lc!!
                       `======~@~==========~@~======`
                      `==============================`
                     `====~@~==================~@~====`
                    `==================================`
                   `==~@~==========================~@~==`
```
Objective
------
To make an AirBnB clone.

Headline User Stories
--------
```
As a space owner
so I can list a new space
I would like to sign up

As a space owner
so I can advertise my properties
I would like to be able to add multiple spaces

As a space owner
so I can provide accurate information
I would like to name the space, add a description and a price per night

As a space owner
So I can manage my bookings
I would like to stop the customer booking an already booked space

As a customer
So I can make a booking
I want to be able to send a request

As a space owner
So I can feel secure about my space
I want to approve or reject booking requests from customers

As a customer
So I know that I have a space guaranteed
I want to be prevented from booking an unavailable space

As a space owner
So I can advertise my available space
I want my space to be available to customers until a booking is confirmed
```

### Instructions

#### Setup Database

- `createdb MakersBnB` and enter the database environment with `psql MakersBnB`;
- Run the script documented in `db/migrations/` in `psql`:

```
DROP TABLE spaces;

CREATE TABLE spaces (
  id SERIAL PRIMARY KEY,
  space_name TEXT,
  description TEXT,
  price DECIMAL(10, 2)
);
```

Note that `psql` will throw an error on `DROP TABLE`
when you first setup `space` table as the `space` table does not exist.
