CREATE TABLE my_users
(
    user_name VARCHAR(50),
    email VARCHAR(25)
);

INSERT INTO my_users VALUES('sourabh', 'sourabh@gmail.com'), ('rony', 'rony@gmail.com')

SELECT * FROM my_users;

CREATE TABLE deleted_users_audit
(
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
);

SELECT * FROM deleted_users_audit;

CREATE or REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
 BEGIN
    INSERT INTO deleted_users_audit VALUES(OLD.user_name, now());
    RAISE NOTICE 'Deleted user audit log created';
    RETURN OLD;
 END
$$

CREATE or REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE
ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

DELETE FROM my_users WHERE user_name = 'sourabh';