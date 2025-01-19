/* Table Creation */

CREATE TABLE ARTIST (
        ArtistID NUMBER(5),
        FirstName VARCHAR(20),
        LastName VARCHAR(20),
        PhoneNumber NUMBER(10)
            );
            
CREATE TABLE ARTWORK (
        ArtID NUMBER(5),
        ArtistID NUMBER(5),
        Title VARCHAR(40),
        Price VARCHAR(20),
        Medium VARCHAR(20),
        OrderID NUMBER(5)
            );
            
CREATE TABLE ART_EXHIBITION (
        ExhibitionID NUMBER(5),
        ArtID NUMBER(5)
            );
            
CREATE TABLE CUSTOMER (
        CustomerID NUMBER(5),
        FirstName VARCHAR(20),
        LastName VARCHAR(20),
        PhoneNumber NUMBER(10)
            );
            
CREATE TABLE EXHIBITION (
        ExhibitionID NUMBER(5),
        ExhibitionName VARCHAR(50),
        StartDate VARCHAR(10),
        EndDate VARCHAR(10)
            );

CREATE TABLE PURCHASE (
        OrderID NUMBER(5),
        ArtID NUMBER(5),
        CustomerID NUMBER(5),
        Price VARCHAR(20),
        DateBought VARCHAR(10)
            );

/* Inserting Tuples into Tables */

INSERT INTO ARTIST VALUES(40971, 'Erina', 'Balp', 2013426793);
INSERT INTO ARTIST VALUES(45371, 'Dave', 'Qona', 2023447896);
INSERT INTO ARTIST VALUES(56709, 'Fiona', 'Humble', 1123455763);
INSERT INTO ARTIST VALUES(65578, 'Ambrose', 'Oi', 2025668943);
INSERT INTO ARTIST VALUES(78941, 'Avery', 'Damby', 2025678995);
INSERT INTO ARTIST VALUES(78954, 'Greg', 'Silo', 2114567832);

INSERT INTO ARTWORK VALUES(11111, 78941, 'Inside', 1200, 'Photography', 89021);
INSERT INTO ARTWORK VALUES(11112, 78954, 'Ongoing', 1100, 'Watercolor', 45781);
INSERT INTO ARTWORK VALUES(11113, 56709, 'Ripple', 900, 'Acrylic on Canvas', 90071);
INSERT INTO ARTWORK VALUES(11114, 45371, 'Scutter', 1200, 'Acrylic on Canvas', 67798);
INSERT INTO ARTWORK VALUES(11115, 65578, 'Ridge', 1000, 'Mixed Media', 56341);
INSERT INTO ARTWORK VALUES(11116, 40971, 'Sisters', 1100, 'Oil on Canvas', 55574);

INSERT INTO ART_EXHIBITION VALUES(56690, 11111);
INSERT INTO ART_EXHIBITION VALUES(56690, 11112);
INSERT INTO ART_EXHIBITION VALUES(56690, 11113);
INSERT INTO ART_EXHIBITION VALUES(56691, 11114);
INSERT INTO ART_EXHIBITION VALUES(56691, 11115);
INSERT INTO ART_EXHIBITION VALUES(56691, 11116);

INSERT INTO CUSTOMER VALUES(55561, 'Ferdinand', 'Lupa', 1046078181);
INSERT INTO CUSTOMER VALUES(55574, 'Gunther', 'Jippy', 2026540054);
INSERT INTO CUSTOMER VALUES(65559, 'Sandra', 'Potts', 2035670009);
INSERT INTO CUSTOMER VALUES(77776, 'Bathazar', 'Dupree', 1014569843);
INSERT INTO CUSTOMER VALUES(86021, 'Adriene', 'Koruza', 1004509603);
INSERT INTO CUSTOMER VALUES(88674, 'Kaori', 'Gappa', 1140096453);

INSERT INTO EXHIBITION VALUES(56690, 'Art By Nature', '11/05/2022', '12/10/2022');
INSERT INTO EXHIBITION VALUES(56691, 'See Through Our Eyes', '12/15/2022', '01/22/2023');

INSERT INTO PURCHASE VALUES(45781, 11112, 88674, 1100, '11/11/2022');
INSERT INTO PURCHASE VALUES(55574, 11116, 55574, 1100, '01/13/2023');
INSERT INTO PURCHASE VALUES(56341, 11115, 86021, 1000, '01/05/2023');
INSERT INTO PURCHASE VALUES(67798, 11114, 65559, 1200, '12/20/2022');
INSERT INTO PURCHASE VALUES(89021, 11111, 77776, 1200, '11/06/2022');
INSERT INTO PURCHASE VALUES(90071, 11113, 55561, 900, '12/01/2022');


/* Adding Primary and Foreign Keys */

ALTER TABLE ARTIST
ADD CONSTRAINT constraint_name 
PRIMARY KEY (ArtistID);

ALTER TABLE ARTWORK 
ADD CONSTRAINT fk_name
FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID);

ALTER TABLE ARTWORK
ADD CONSTRAINT constraint_name 
PRIMARY KEY (ArtID);

ALTER TABLE ART_EXHIBITION
ADD CONSTRAINT fk_name
FOREIGN KEY (ArtID) REFERENCES Artwork(ArtID);

ALTER TABLE EXHIBITION
ADD CONSTRAINT constraint_name 
PRIMARY KEY (ExhibitionID);

ALTER TABLE ART_EXHIBITION
ADD CONSTRAINT fk_name
FOREIGN KEY (ExhibitionID) REFERENCES Exhibition(ArtID);

ALTER TABLE PURCHASE
ADD CONSTRAINT constraint_name 
PRIMARY KEY (OrderID);

ALTER TABLE ARTWORK
ADD CONSTRAINT fk_name
FOREIGN KEY (OrderID) REFERENCES Purchase(OrderID);

ALTER TABLE ARTWORK
ADD CONSTRAINT constraint_name 
PRIMARY KEY (ArtID);

ALTER TABLE PURCHASE
ADD CONSTRAINT fk_name
FOREIGN KEY (ArtID) REFERENCES Artwork(ArtID);

ALTER TABLE CUSTOMER
ADD CONSTRAINT constraint_name 
PRIMARY KEY (CustomerID);

ALTER TABLE PURCHASE
ADD CONSTRAINT fk_name
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);


/* Creating Views of Tables Before Queries */

SELECT * FROM ARTIST;
SELECT * FROM ARTWORK;
SELECT * FROM ART_EXHIBITION;
SELECT * FROM CUSTOMER;
SELECT * FROM EXHIBITION;
SELECT * FROM PURCHASE;

/* Ten Project Queries */

/*Query 1*/

SELECT FirstName, LastName
FROM Artist
Order By ArtistID DESC;

/*Query 2*/

SELECT Title, Price
FROM Artwork
ORDER BY Price ASC;

/*Query 3*/

SELECT Title, Medium, Price
FROM Artwork
ORDER BY Medium, Price DESC;

/*Query 4*/

SELECT Medium, COUNT(Medium) AS artTypeCount
FROM Artwork
GROUP BY Medium
ORDER BY Medium;


/*Query 5*/

SELECT Medium, COUNT(Medium) AS artTypeCount, SUM(Price) AS galleryTotal
FROM Artwork
GROUP BY Medium;


/*Query 6*/

SELECT ExhibitionName, COUNT(ExhibitionName) AS numberOfExhibitions
FROM Exhibition
GROUP BY ExhibitionName;


/*Query 7*/

SELECT a.ArtistID, FirstName, LastName, Title, Price, Medium
FROM Artist a, Artwork b
WHERE a.ArtistID = b.ArtistID;


/*Query 8*/

SELECT a.ExhibitionID, ArtID, ExhibitionName
FROM art_Exhibition a, Exhibition b
WHERE a.ExhibitionID = b.ExhibitionID;


/*Query 9*/

SELECT a.CustomerID, FirstName, LastName, ArtID, Price, DateBought 
FROM purchase a , customer b 
WHERE a.CustomerID = b.CustomerID;


/*Query 10*/

SELECT a.ExhibitionID, c.ArtID, Title, ExhibitionName
FROM art_Exhibition a, artwork c, Exhibition b
WHERE a.ExhibitionID = b.ExhibitionID AND a.ArtID = c.ArtID ;


