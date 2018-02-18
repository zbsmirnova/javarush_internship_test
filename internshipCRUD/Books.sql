DROP DATABASE IF EXISTS test;

CREATE DATABASE test;

USE test;

CREATE TABLE `test`.`books` (
  `id` INT(8) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `author` VARCHAR(100) NOT NULL,
  `isbn` VARCHAR(20) NOT NULL,
  `printYear` INT(11) NOT NULL,
  `isReadAlready` BIT(1) NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = cp1251 COLLATE cp1251_bin AUTO_INCREMENT=22;


INSERT INTO test.books (`id`,`title`, `description`, `author`, `isbn`, `printYear`, `isReadAlready`) VALUES

  (1,'The Hunger Games', 'Action', 'Suzanne Collins ','11-111', 1855, 0),
  (2,'To Kill a Mockingbird ', 'Fiction', 'Harper Lee ','22-222', 1965, 0),
  (3,'The Book Thief ', 'Fiction', 'Markus Zusak','33-333', 1977, 0),
  (4,'The Chronicles of Narnia', 'Fantasy', 'C.S. Lewis','44-444', 1989, 0),
  (5,'Harry Potter', 'Fantasy', 'J.K. Rowling ','55-555', 2001, 0),
  (6,'Gone with the Wind', 'Romance', 'Margaret Mitchell ','66-666', 1829, 0),
  (7,'The Hobbit and The Lord of the Rings ', 'Fantasy', 'J.R.R. Tolkien','77-777', 1966, 0),
  (8,'Pride and Prejudice', 'Romance', 'Jane Austen ','88-888', 1820, 0),
  (9,'The Fault in Our Stars', 'Fiction', 'John Green','99-999', 1993, 0),
  (10,'The Da Vinci Code', 'Fantasy', 'Dan Brown','10-101', 1992, 0),
  (11,'Alice''s Adventures in Wonderland', 'Fantasy', 'Lewis Carroll','11-111', 1969, 0),
  (12,'The Picture of Dorian Gray', 'Mystery', 'Oscar Wilde ','12-121', 1832, 0),
  (13,'Les Miserables', 'Romance', 'Victor Hugo','13-131', 1855, 0),
  (14,'Romeo and Juliet', 'Romance', 'William Shakespeare ','14-141', 1631, 0),
  (15,'Jane Eyre', 'Fiction', 'Charlotte Bronte ','15-151', 1812, 0),
  (16,'Crime and Punishment', 'Drama', 'Fyodor Dostoyevsky','16-161', 1848, 0),
  (17,'The Great Gatsby', 'Fiction', 'F. Scott Fitzgerald ','17-171', 1955, 0),
  (18,'One Hundred Years of Solitude', 'Fiction', 'Gabriel Garcia Marquez','18-181', 1793, 0),
  (19,'The Adventures of Huckleberry Finn ', 'Fiction', 'Mark Twain ','19-191', 1878, 0),
  (20,'Fahrenheit 451', 'Fantasy', 'Ray Bradbury','20-202', 1915, 0),
  (21,'A Game of Thrones', 'Fantasy', 'George R.R. Martin','20-202', 1995, 0);
