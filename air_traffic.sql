-- from the terminal run:
-- psql < air_traffic.sql
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic 

CREATE TABLE airlines (
  airline_id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE cities (
  city_id SERIAL PRIMARY KEY,
  city_code TEXT UNIQUE NOT NULL,
  city_name TEXT NOT NULL
);

CREATE TABLE countries (
  country_id SERIAL PRIMARY KEY,
  country_code TEXT UNIQUE NOT NULL,
  country_name TEXT NOT NULL
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat_number TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city_code TEXT NOT NULL,
  from_country_code TEXT NOT NULL,
  to_city_code TEXT NOT NULL,
  to_country_code TEXT NOT NULL,
  FOREIGN KEY (from_city_code) REFERENCES cities(city_code),
  FOREIGN KEY (from_country_code) REFERENCES countries(country_code),
  FOREIGN KEY (to_city_code) REFERENCES cities(city_code),
  FOREIGN KEY (to_country_code) REFERENCES countries(country_code)
);

INSERT INTO
  airlines (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO
  countries (country_code, country_name)
VALUES
  ('US', 'United States'),
  ('JP', 'Japan'),
  ('GB', 'United Kingdom'),
  ('MX', 'Mexico'),
  ('MA', 'Morocco'),
  ('CN', 'China'),
  ('FR', 'France'),
  ('AE', 'United Arab Emirates'),
  ('BR', 'Brazil'),
  ('CL', 'Chile');

INSERT INTO
  cities (city_code, city_name)
VALUES
  ('DCA', 'Washington DC'),
  ('NRT', 'Tokyo'),
  ('LAX', 'Los Angeles'),
  ('LAS', 'Las Vegas'),
  ('CMN', 'Morocco'),
  ('PEK', 'Beijing'),
  ('MEX', 'Mexico City'),
  ('ORD', 'Chicago'),
  ('SEA', 'Seattle'),
  ('CDG', 'Paris'),
  ('DXB', 'Dubai'),
  ('JFK', 'New York'),
  ('CID', 'Cedar Rapids'),
  ('CLT', 'Charlotte'),
  ('MSY', 'New Orleans'),
  ('GRU', 'Sao Paulo'),
  ('SCL', 'Chile');

INSERT INTO
  tickets (
    first_name,
    last_name,
    seat_number,
    departure,
    arrival,
    airline,
    from_city_code,
    from_country_code,
    to_city_code,
    to_country_code
  )
VALUES
  (
    'Jennifer',
    'Finch',
    '33B',
    '2018-04-08 09:00:00',
    '2018-04-08 12:00:00',
    'United',
    'DCA',
    'US',
    'SEA',
    'US'
  ),
  (
    'Thadeus',
    'Gathercoal',
    '8A',
    '2018-12-19 12:45:00',
    '2018-12-19 16:15:00',
    'British Airways',
    'NRT',
    'JP',
    'LAX',
    'GB'
  ),
  (
    'Sonja',
    'Pauley',
    '12F',
    '2018-01-02 07:00:00',
    '2018-01-02 08:03:00',
    'Delta',
    'LAX',
    'US',
    'LAS',
    'US'
  ),
  (
    'Jennifer',
    'Finch',
    '20A',
    '2018-04-15 16:50:00',
    '2018-04-15 21:00:00',
    'Delta',
    'SEA',
    'US',
    'MEX',
    'MX'
  ),
  (
    'Waneta',
    'Skeleton',
    '23D',
    '2018-08-01 18:30:00',
    '2018-08-01 21:50:00',
    'TUI Fly Belgium',
    'CDG',
    'FR',
    'CMN',
    'MA'
  ),
  (
    'Thadeus',
    'Gathercoal',
    '18C',
    '2018-10-31 01:15:00',
    '2018-10-31 12:55:00',
    'Air China',
    'DXB',
    'AE',
    'PEK',
    'CN'
  ),
  (
    'Berkie',
    'Wycliff',
    '9E',
    '2019-02-06 06:00:00',
    '2019-02-06 07:47:00',
    'United',
    'JFK',
    'US',
    'CLT',
    'US'
  ),
  (
    'Alvin',
    'Leathes',
    '1A',
    '2018-12-22 14:42:00',
    '2018-12-22 15:56:00',
    'American Airlines',
    'CID',
    'US',
    'ORD',
    'US'
  ),
  (
    'Berkie',
    'Wycliff',
    '32B',
    '2019-02-06 16:28:00',
    '2019-02-06 19:18:00',
    'American Airlines',
    'CLT',
    'US',
    'MSY',
    'US'
  ),
  (
    'Cory',
    'Squibbes',
    '10D',
    '2019-01-20 19:30:00',
    '2019-01-20 22:45:00',
    'Avianca Brasil',
    'GRU',
    'BR',
    'SCL',
    'CL'
  );