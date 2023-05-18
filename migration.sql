DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS todo;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE todo (
    id SERIAL,
    task_name TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id)
);


INSERT INTO users (first_name, last_name) VALUES ('John', 'Doe');
INSERT INTO users (first_name, last_name) VALUES ('Jane', 'Smith');
INSERT INTO users (first_name, last_name) VALUES ('Michael', 'Johnson');

INSERT INTO todo (task_name, user_id) VALUES ('Task 1', 1);
INSERT INTO todo (task_name, user_id) VALUES ('Task 2', 2);
INSERT INTO todo (task_name, user_id) VALUES ('Task 3', 1);
INSERT INTO todo (task_name, user_id) VALUES ('Task 4', 3);
INSERT INTO todo (task_name, user_id) VALUES ('Task 5', 2);
INSERT INTO todo (task_name, user_id) VALUES ('Task 6', 1);
INSERT INTO todo (task_name, user_id) VALUES ('Task 7', 3);
INSERT INTO todo (task_name, user_id) VALUES ('Task 8', 2);
INSERT INTO todo (task_name, user_id) VALUES ('Task 9', 1);
INSERT INTO todo (task_name, user_id) VALUES ('Task 10', 2);
INSERT INTO todo (task_name, user_id) VALUES ('Task 11', 3);
INSERT INTO todo (task_name, user_id) VALUES ('Task 12', 2);
INSERT INTO todo (task_name, user_id) VALUES ('Task 13', 1);
INSERT INTO todo (task_name, user_id) VALUES ('Task 14', 3);
INSERT INTO todo (task_name, user_id) VALUES ('Task 15', 2);
