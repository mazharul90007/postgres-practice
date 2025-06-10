CREATE TABLE "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
);

DROP TABLE post;
DROP TABLE "user";

INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

SELECT * from "user";

INSERT INTO post(title, user_id) VALUES
('Enjoying a sunng day with Akash', 4),
('Batash is playing cricket', 2),
('sagor loves swimming', 3),
('Nodi is dancing', 4);

SELECT * from "post";

ALTER TABLE post
    alter COLUMN user_id set NOT NULL;

DELETE FROM "user"
    WHERE id = 4;

INSERT INTO post (id, title, user_id) VALUES 
(5, 'This is a test post title', NULL);

SELECT * FROM post
    LEFT JOIN "user" on post.user_id = "user".id;

SELECT * FROM post
    RIGHT JOIN "user" on post.user_id = "user".id;

