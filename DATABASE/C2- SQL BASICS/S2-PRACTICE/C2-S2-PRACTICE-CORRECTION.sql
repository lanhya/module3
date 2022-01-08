-- Q1)
CREATE DATABASE IF NOT EXISTS stock;

-- Q2)
SHOW DATABASES;

-- Q3)
USE stock;

-- Q4)
CREATE TABLE IF NOT EXISTS category(
	catid INT NOT NULL AUTO_INCREMENT,
	catname VARCHAR(50) NOT NULL,
	description VARCHAR(220) NULL,
	mastercatid INT NULL,
    PRIMARY KEY(catid)
);

-- Q5)
CREATE TABLE IF NOT EXISTS supplier(
	supplierid INT NOT NULL AUTO_INCREMENT,
    suppliername VARCHAR(40) NOT NULL,
    phone VARCHAR(12) NULL,
    email VARCHAR(40) NULL,
    logo longblob NULL,
    isdeleted INT DEFAULT 0,
    PRIMARY KEY(supplierid)
);

-- Q6) 
CREATE TABLE IF NOT EXISTS masterproductlist(
    productid INT NOT NULL AUTO_INCREMENT,
    productname VARCHAR(120) NOT NULL,
    barcode VARCHAR(40) NULL,
    model VARCHAR(40) NULL,
    size VARCHAR(40) NULL,
    unitfactor VARCHAR(30) NULL,
    catid INT NULL,
    storeid INT NULL, 
    isdelete INT DEFAULT 0 NOT NULL,
    description VARCHAR(220),
    PRIMARY KEY(productid)
);


-- Q7)
CREATE TABLE IF NOT EXISTS store(
    storeid INT NOT NULL AUTO_INCREMENT,
    storename VARCHAR(40) NOT NULL,
    description VARCHAR(220) NULL,
    locationid INT NULL,
    managerid INT NULL,
    isdeleted INT DEFAULT 0 NOT NULL,
    PRIMARY KEY(storeid)
);

-- Q8) 
CREATE TABLE IF NOT EXISTS location(
    locationid INT NOT NULL AUTO_INCREMENT,
    locationname VARCHAR(50) NOT NULL,
    description VARCHAR(200) NULL,
    managerid VARCHAR(20) NULL,
    PRIMARY KEY(locationid)
);

-- Q9)
ALTER TABLE category ADD COLUMN isdeleted INT DEFAULT 0;

-- Q10)
ALTER TABLE location DROP COLUMN managerid;

-- Q11)
ALTER TABLE supplier change logo companylogo longblob;

-- Q12) 
ALTER TABLE masterproductlist RENAME TO productlist;

-- Q13) 
CREATE TABLE IF NOT EXISTS product LIKE productlist;

-- Q14)
CREATE TABLE IF NOT EXISTS positionlist(
    positionid INT NOT NULL AUTO_INCREMENT,
    positionname VARCHAR(50) NOT NULL,
    description VARCHAR(200) NULL,
    PRIMARY KEY(positionid)
);

-- Q15)
CREATE TABLE IF NOT EXISTS department(
    depid INT NOT NULL AUTO_INCREMENT,
    depname VARCHAR(40) NOT NULL,
    description VARCHAR(200) NULL,
    PRIMARY KEY(depid)
);