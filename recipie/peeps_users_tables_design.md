# User & Peeps Tables Design Recipe

## 1. Extract nouns from the user stories or specification

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

```
Nouns:

peep, chitter, time, signup, login, logout, tagged
```

## 2. Infer the Table Name and Columns

| Record                | Properties                      |
| --------------------- | ------------------------------- |
| user                  | name, username, email, password |
| peep                  | peep, time, user_id             |

1. Name of the first table (always plural): `users` 

    Column names: `name`, `username`, `email`, `password`

2. Name of the second table (always plural): `peeps` 

    Column names: `peep`, `time`, `user_id`

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
Table: users
id: SERIAL
name: text
username: text
email: text
password: text

Table: peeps
id: SERIAL
peep: text
time: time
user_id: int
```

## 4. Decide on The Tables Relationship

1. Can one USER have many PEEPS? Yes
2. Can one PEEP have many USERS? No

-> Therefore,
-> A USER has many PEEPS 
-> And on the other side, PEEPS belongs to USER.

-> In that case, the foreign key is in the table PEEPS

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);

-- Then the table with the foreign key first.
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  peep text,
  time time,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_peeps foreign key(user_id)
    references peeps(id)
    on delete cascade
);

```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 chitter < users_table.sql
psql -h 127.0.0.1 chitter < peeps_table.sql
```
