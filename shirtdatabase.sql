select * from accounts;
select * from size ;
select * from productsize ;
select * from brands;
select * from cart;
select * from colors;
select * from productcolor;
select * from products;


DROP TABLE cart ;
DROP TABLE productsize ;
DROP TABLE accounts ;
DROP TABLE productcolor ;
DROP TABLE products;
DROP TABLE size ;
DROP TABLE brands;
DROP TABLE colors ;

CREATE TABLE accounts (
    accountId   int(6) NOT NULL,
    firstName 	VARCHAR(100) NOT NULL,
    lastName	 VARCHAR(100) NOT NULL,
    email    	VARCHAR(100) NOT NULL,
    password      VARCHAR(500) NOT NULL,
    accountRole  VARCHAR(30) NOT NULL
);

ALTER TABLE accounts ADD CONSTRAINT accounts_pk PRIMARY KEY ( accountid );

CREATE TABLE brands (
    brandId    int(6) NOT NULL,
    brandName  VARCHAR(30) NOT NULL
);

ALTER TABLE brands ADD CONSTRAINT brands_pk PRIMARY KEY ( brandId );

CREATE TABLE colors (
    colorId     int(6) NOT NULL,
    colorName   VARCHAR(30) NOT NULL,
    colorValue  VARCHAR(30) NOT NULL
);

ALTER TABLE colors ADD CONSTRAINT colors_pk PRIMARY KEY ( colorId );

CREATE TABLE size (
    sizeId	    int(6) NOT NULL,
    sizeValue	    VARCHAR (10) NOT NULL
);

ALTER TABLE size ADD CONSTRAINT size_pk PRIMARY KEY ( sizeId );


CREATE TABLE products (
    productId           int(6) NOT NULL,
    productName         VARCHAR(100) NOT NULL,
    productDescription  VARCHAR(300) NOT NULL,
    onsaleDate          DATE NOT NULL,
    productPrice        double(10, 2) NOT NULL,
    productImage        VARCHAR(5000) NOT NULL,
    brandId             int(6) NOT NULL
);

ALTER TABLE products ADD CONSTRAINT products_pk PRIMARY KEY ( productId );

ALTER TABLE products
    ADD CONSTRAINT products_brands_fk FOREIGN KEY ( brandId )
        REFERENCES brands ( brandId );        

CREATE TABLE productcolor (
    productcolorId  int(6) NOT NULL,
    productId       int(6) NOT NULL,
    colorId         int(6) NOT NULL
);

ALTER TABLE productcolor ADD CONSTRAINT productcolor_pk PRIMARY KEY ( productcolorId );

ALTER TABLE productcolor
    ADD CONSTRAINT productcolor_colors_fk FOREIGN KEY ( colorId )
        REFERENCES colors ( colorId );

ALTER TABLE productcolor
    ADD CONSTRAINT productcolor_products_fk FOREIGN KEY ( productId )
        REFERENCES products ( productId );

CREATE TABLE productsize (
    productsizeId 	 int(6) NOT NULL,
    productId		 int(6) NOT NULL,
    sizeId		 int(6) NOT NULL
);

ALTER TABLE productsize ADD CONSTRAINT productsize_pk PRIMARY KEY ( productsizeId );

ALTER TABLE productsize ADD CONSTRAINT productsize_products_fk FOREIGN KEY ( productId )
        REFERENCES products ( productId );
        
ALTER TABLE productsize
    ADD CONSTRAINT productsize_size_fk FOREIGN KEY ( sizeId )
        REFERENCES size ( sizeId );
        
CREATE TABLE cart (
    cartId    			int(6) NOT NULL,
    accountId 			int(6) NOT NULL,
    productId 			int(6) NOT NULL,
    productName  		VARCHAR(100) NOT NULL,
    productDescription  	VARCHAR(300) NOT NULL,
    productPrice        	double(10, 2) NOT NULL,
    productImage        	VARCHAR(5000) NOT NULL,
    sizeValue	    		VARCHAR (10) NOT NULL,
    brandName  			VARCHAR(30) NOT NULL,
    colorName  			VARCHAR(30) NOT NULL,
    colorValue  		VARCHAR(30) NOT NULL,
    quantity  			int(10) NOT NULL
);

ALTER TABLE cart ADD CONSTRAINT cart_pk PRIMARY KEY ( cartid );

ALTER TABLE cart
    ADD CONSTRAINT cart_accounts_fk FOREIGN KEY ( accountid )
        REFERENCES accounts ( accountid );

ALTER TABLE cart
    ADD CONSTRAINT cart_products_fk FOREIGN KEY ( productid )
        REFERENCES products ( productid );

------------------- INSERT TABLES ---------------------

insert into brands values (000001,'Nike');
insert into brands values (000002,'Uniqlo');
insert into brands values (000003,'H&M');
insert into brands values (000004,'Adidas');
insert into brands values (000005,'Lacoste');

insert into size values (800001,'S');
insert into size values (800002,'M');
insert into size values (800003,'L');
insert into size values (800004,'XL');
insert into size values (800005,'2XL');

insert into products values (100001,'MEN Nike Sportswear','The Nike Sportswear T-Shirt is designed with the shape and feel of your favorite vintage t-shirt.','2019-12-17',1400.00,'men-nike-sportswear.jpg',000001);
insert into products values (100002,'MEN Dry-EX Marvel', 'MEN Dry-EX Marvel Crew Neck Short Sleeve T-Shirt','2020-06-23',590.00,'men-uniqlo-dryexmarvel.jpg',000002);

insert into colors values (600001,'Red','#FF0000');
insert into colors values (600002,'Black','#000000');
insert into colors values (600003,'White','#FFFFFF');
insert into colors values (600004,'Yellow','#FFFF00');
insert into colors values (600005,'Blue','#0000FF');

insert into productcolor values (700001,100001,600001);
insert into productcolor values (700002,100001,600002);
insert into productcolor values (700003,100001,600003);
insert into productcolor values (700004,100002,600002);
insert into productcolor values (700005,100002,600005);

insert into productsize values (900001,100001,800002);
insert into productsize values (900002,100001,800003);
insert into productsize values (900003,100001,800004);
insert into productsize values (900004,100002,800001);
insert into productsize values (900005,100002,800003);

insert into accounts values (300001,'Arnon','Pakdee','arnon09@gmail.com','arnon999','Admin');
insert into accounts values (300002,'Thanadol','Sae-Tung','thanadol11@gmail.com','thanadol33','Admin');

insert into cart values (500001,300001,100001,'MEN Nike Sportswear','The Nike Sportswear T-Shirt is designed with the shape and feel of your favorite vintage t-shirt.',1400.00,'men-nike-sportswear.jpg','S','Nike','Red','#FF0000',1);
insert into cart values (500002,300001,100002,'MEN Dry-EX Marvel', 'MEN Dry-EX Marvel Crew Neck Short Sleeve T-Shirt',590.00,'men-uniqlo-dryexmarvel.jpg','L','Uniqlo','White','#FFFFFF',3);