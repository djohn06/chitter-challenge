DROP TABLE IF EXISTS peeps;

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

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (peep, time, user_id) VALUES ('What a lovely day!', '09:13:15', '1');
INSERT INTO peeps (peep, time, user_id) VALUES ('What a terrible day...', '08:37:18', '2');
INSERT INTO peeps (peep, time, user_id) VALUES ('Going to walk the dog!', '11:19:09', '3');
INSERT INTO peeps (peep, time, user_id) VALUES ('Another day, another dollar. Let do this!', '10:49:40', '4');

SELECT * FROM "peeps" ORDER BY "time" DESC LIMIT 300 OFFSET 0;