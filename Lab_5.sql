
CREATE DATABASE PlayStoreDB;
USE PlayStoreDB;


-- Task 1

CREATE TABLE Developers(
  DeveloperID INT PRIMARY KEY,
  DeveloperName VARCHAR(60) NOT NULL,
  Country VARCHAR(30),
  FoundedYear INT
  );
  
CREATE TABLE Publishers(
PublisherID INT PRIMARY KEY,
PublisherName VARCHAR(60) ,
HeadOffice VARCHAR(40),
SupportEmail VARCHAR(60)
);

CREATE TABLE Categories(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(40),
MinimumAge INT
);

CREATE TABLE Apps(
AppID INT PRIMARY KEY,
AppName VARCHAR(60),
DeveloperID INT,
PublisherID INT,
CategoryID INT,
Rating DECIMAL,
Downloads INT,
Price DECIMAL(6.2)
);

INSERT INTO Developers
VALUES
(101,'Google LLC','USA',1998),
(102,'Meta Platforms','USA',2004),
(103,'Spotify AB','Sweden',2006),
(104,'Canva Pty Ltd','Australia',2012),
(105,'BYJU''S','India',2011);

INSERT INTO Publishers
VALUES
(201,'Google Play','california','support@google.com'),
(202,'Samsung Galaxy Store','Seoul','support@samsung.com'),
(203,'Huawai AppGallery','Shenzhen','support@huawei.com'),
(204,'Amazon Appstore','Seattle','support@amazon.com');

INSERT INTO Categories
VALUES
(301,'Education',3),
(302,'Productivy',3),
(303,'Music',12),
(304,'Social',13),
(305,'Gaming',16);

SELECT * FROM Publishers;

DROP TABLE Apps;
CREATE TABLE Apps(
AppID INT PRIMARY KEY,
AppName VARCHAR(60),
DeveloperID INT,
PublisherID INT,
CategoryID INT,
Rating DECIMAL,
Downloads BIGINT,
Price DECIMAL(6.2)
);
INSERT INTO Apps
VALUES
(1001,'Google Classroom',101,201,301,4.6,500000000,0),
(1002,'Google Keep',101,201,302,4.5,1000000000,0),
(1003,'Instagram',102,201,304,4.4,5000000000,0),
(1004,'Spotify',103,201,303,4.5,1000000000,0),
(1005,'Canva',104,201,302,4.7,500000000,0),
(1006,'BYJU''S Learning',105,201,301,4.3,100000000,299),
(1007,'Candy Crush',102,204,305,4.6,1000000000,0),
(1008,'Temple Run',104,203,305,4.2,500000000,0);

SELECT *FROM Developers;
SELECT *FROM Publishers;
SELECT *FROM Categories;
SELECT * FROM Apps;
DESC Apps;

-- level1
-- 1
INSERT INTO Developers
VALUES
(106,'OpenAI','USA',2015);
-- 2
INSERT INTO Categories
VALUES
(306,'Artifical Intelligence',12);
-- 3
INSERT INTO Apps
VALUES
(1009,'ChatGpt',106,201,306,4.9,100000000000,0);
-- 4
UPDATE Apps SET Rating = 4.5 WHERE AppID=1008;
-- 5
DELETE FROM Developers WHERE DeveloperID=105;

-- LEVEL2
-- 1
UPDATE Publishers SET SupportEmail='support@samsunggalaxy.com' WHERE PublisherID=202;
-- 2
INSERT INTO Apps VALUES
(1010,'Whatsapp',102,201,304,4.7,4000000000,0),
(1011,'Youtube',101,201,303,4.8,10000000000,0);
-- 3
UPDATE Apps SET Price=199 WHERE AppID=1006;
-- 4
DELETE FROM Categories WHERE CategoryID=303;
-- 5
SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;


-- Task 2

USE PlayStoreDB;
-- Level 0
-- 1
SELECT UPPER(DeveloperName) FROM Developers;
-- 2
SELECT LOWER(DeveloperName) FROM Developers;
-- 3
SELECT AppName,LENGTH(AppName) AS NameLength FROM Apps;
-- 4
SELECT CategoryName,LENGTH(CategoryName) AS NameLength FROM Categories;
-- 5 
SELECT CURRENT_DATE(),CURRENT_TIME();
-- 6
SELECT AppName,ROUND(Rating,0) AS RoundedRating FROM Apps;

-- Level 1
-- 1
SELECT AppName,SUBSTRING(AppName,1,5) AS First5Characters FROM Apps;
-- 2
SELECT CONCAT(DeveloperName,' ',Country) AS DeveloperCountry FROM Developers;
-- 3
SELECT AppName,ROUND(Rating,1) AS RoundedRating FROM Apps;
-- 4
SELECT AppName,CEIL(Price) AS CeilPrice FROM Apps;
-- 5
SELECT DeveloperName,FoundedYear FROM Developers;
-- 6
SELECT AppName, CAST(Downloads AS CHAR) AS DownloadsText FROM Apps;

SELECT * FROM Categories;
SELECT * FROM Developers;

-- Level 2
-- 1
SELECT UPPER(AppName) AS AppName, Rating FROM Apps;
-- 2
SELECT CategoryName, SUBSTRING(CategoryName,1,3) AS First3Characters FROM Categories;
-- 3
SELECT AppName,ABS(Price-200) AS PriceDifference FROM Apps;
-- 4
SELECT DeveloperName, LENGTH(DeveloperName) as DeveloperNameLength FROM Developers;
-- 5
SELECT CURRENT_DATE(), CURRENT_TIME();
-- 6
SELECT DeveloperName, CAST(FoundedYear AS CHAR) AS FoundedYearText FROM Developers;


-- Task 3

USE PlayStoreDB;

-- Level 0
DELETE FROM Apps WHERE AppID = 1006;
-- 1
ALTER TABLE Apps ADD CONSTRAINT fk_apps_developers FOREIGN KEY (DeveloperID) REFERENCES Developers(DeveloperID);
-- 2
ALTER TABLE Apps ADD CONSTRAINT fk_apps_publishers FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID);
-- 3
ALTER TABLE Apps ADD CONSTRAINT fk_apps_categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
-- 4
SELECT * FROM Apps WHERE Rating > 4.5;
-- 5
SELECT * FROM Apps WHERE Price = 0;
-- 6
SELECT * FROM Apps WHERE CategoryID = 305;


-- Level 1
-- 1
SELECT * FROM Apps WHERE Downloads > 500000000;
-- 2
SELECT * FROM Apps WHERE Rating BETWEEN 4.3 AND 4.7;
-- 3
SELECT * FROM Apps WHERE Price IN (0, 299);
-- 4
SELECT * FROM Apps WHERE AppName LIKE 'G%';
-- 5
SELECT * FROM Apps WHERE AppName LIKE '%Google%';
-- 6
SELECT * FROM Apps WHERE Rating > 4.0 AND Downloads > 500000000;
-- 7
SELECT * FROM Apps WHERE CategoryID = 301 OR CategoryID = 305;


-- Level 2
-- 1
SELECT * FROM Apps WHERE AppName NOT LIKE 'G%';
-- 2
SELECT * FROM Apps WHERE Rating < 4.5 OR Downloads > 1000000000;
-- 3
SELECT * FROM Developers WHERE DeveloperName LIKE '%a%';
-- 4
SELECT * FROM Apps WHERE Price BETWEEN 0 AND 300;
-- 5
SELECT * FROM Apps WHERE PublisherID IN (201, 204);
-- 6
INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price) VALUES (9999, 'Test App', 999, 201, 301, 4.0, 1000, 0);
-- 7
SELECT * FROM Apps WHERE CategoryID <> 305;


-- Task 4

-- Level 0

-- 1
SELECT COUNT(*) AS TotalApps 
FROM Apps;

-- 2
SELECT AVG(Rating) AS AverageRating 
FROM Apps;

-- 3
SELECT MAX(Rating) AS HighestRating 
FROM Apps;

-- 4
SELECT MIN(Rating) AS LowestRating 
FROM Apps;

-- 5
SELECT SUM(Downloads) AS TotalDownloads 
FROM Apps;

-- 6
SELECT * 
FROM Apps 
ORDER BY Rating DESC;

-- Level 1

-- 1
SELECT CategoryID, COUNT(*) AS AppCount
FROM Apps
GROUP BY CategoryID;

-- 2
SELECT CategoryID, AVG(Rating) AS AverageRating
FROM Apps
GROUP BY CategoryID;

-- 3
SELECT MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice 
FROM Apps;

-- 4
SELECT * 
FROM Apps 
ORDER BY Downloads DESC;

-- 5
SELECT DeveloperID, COUNT(*) AS AppCount 
FROM Apps 
GROUP BY DeveloperID;

-- 6
SELECT CategoryID, COUNT(*) AS AppCount 
FROM Apps 
GROUP BY CategoryID 
HAVING COUNT(*) > 1;


-- Level 2

-- 1
SELECT DeveloperID, SUM(Downloads) AS TotalDownloads
FROM Apps
GROUP BY DeveloperID;

-- 2
SELECT PublisherID, AVG(Rating) AS AverageRating
FROM Apps
GROUP BY PublisherID;

-- 3
SELECT DeveloperID, COUNT(*) AS AppCount
FROM Apps
GROUP BY DeveloperID
HAVING COUNT(*) > 1;

-- 4
SELECT CategoryID, AVG(Rating) AS AverageRating
FROM Apps
GROUP BY CategoryID
HAVING AVG(Rating) > 4.3;

-- 5
SELECT CategoryID, COUNT(*) AS TotalApps
FROM Apps
GROUP BY CategoryID
ORDER BY TotalApps DESC;

-- 6
SELECT *
FROM Apps
WHERE Rating = (SELECT MAX(Rating) FROM Apps);

-- 7
SELECT DeveloperID, SUM(Price) AS TotalPrice
FROM Apps
GROUP BY DeveloperID;

select * from Developers;
select * from Apps;
select * from Publishers;
select * from Categories;


-- Task 5

-- Level 0
-- 1
UPDATE Apps 
SET Rating = 4.8 
WHERE AppName = 'Google Keep';

COMMIT;

-- 2
UPDATE Apps 
SET Price = 150 
WHERE AppName = 'BYJU''S Learning';

ROLLBACK;

-- 3

INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price)
VALUES (1012, 'Google Docs', 101, 201, 302, 4.5, 1000000000, 0);

COMMIT;

-- 4

INSERT INTO Developers (DeveloperID, DeveloperName, Country, FoundedYear)
VALUES (107, 'Twitter / X', 'USA', 2006);

ROLLBACK;

-- 5

UPDATE Apps
SET Rating = 4.9
WHERE AppName = 'Instagram';

SAVEPOINT sp_after_rating_update;

SET SQL_SAFE_UPDATES = 0;

-- Level 1
UPDATE Apps 
SET Rating = 4.7 
WHERE AppName = 'Spotify';

SAVEPOINT sp_rating_one;

UPDATE Apps 
SET Rating = 4.8 
WHERE AppName = 'Canva';

UPDATE Apps 
SET Rating = 3.0 
WHERE AppName = 'Instagram';

ROLLBACK TO SAVEPOINT sp_rating_one;

INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price)
VALUES (1013, 'Google Drive', 101, 201, 302, 4.6, 5000000000, 0);

SAVEPOINT sp_app_inserted;

UPDATE Apps 
SET Price = 99 
WHERE AppID = 1013;

ROLLBACK TO SAVEPOINT sp_app_inserted;
