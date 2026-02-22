-- Creating Tables of online shopping


CREATE TABLE users
(
    user_id INT NOT NULL
    ,name VARCHAR(20)
    ,phoneNumber VARCHAR(20)
    ,PRIMARY KEY(user_id)
);

CREATE TABLE buyers
(
    user_id INT NOT NULL
    ,PRIMARY KEY(user_id)
    ,FOREIGN KEY(user_id) REFERENCES users(user_id)
);


CREATE TABLE sellers
(
    user_id INT NOT NULL
    ,PRIMARY KEY(user_id)
    ,FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE Bank_card
(
    card_number VARCHAR(25) NOT NULL
    ,expiryDate DATE
    ,bank VARCHAR(20)
    ,PRIMARY KEY(card_number)
);

CREATE TABLE
Credit_card
(
    card_number VARCHAR(25) NOT NULL
    ,user_id INT NOT NULL
    ,organization VARCHAR(20)
    ,PRIMARY KEY(card_number)
    ,FOREIGN KEY(card_number) REFERENCES Bank_card(card_number)
    ,FOREIGN KEY(user_id) REFERENCES users(user_id)
);


CREATE TABLE Debit_card
(
    card_number VARCHAR(25) NOT NULL
    ,user_id INT NOT NULL
    ,PRIMARY KEY(card_number)
    ,FOREIGN KEY(card_number) REFERENCES Bank_card(card_number)
    ,FOREIGN KEY(user_id) REFERENCES Users(user_id)
);


CREATE TABLE Address
(
    addr_id INT NOT NULL
    ,user_id INT NOT NULL
    ,name VARCHAR(50)
    ,contact_phonenumber VARCHAR(20)
    ,province VARCHAR(100)
    ,city VARCHAR(100)
    ,streetaddr VARCHAR(100)
    ,postcode VARCHAR(12)
    ,PRIMARY KEY(addr_id)
    ,FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE Store
(
    s_id INT NOT NULL
    ,name VARCHAR(20)
    ,province VARCHAR(20)
    ,city VARCHAR(20)
    ,streetaddr VARCHAR(20)
    ,customerGrade INT
    ,startTime DATE
    ,PRIMARY KEY(s_id)
);

CREATE TABLE Brand
(
    brand_name VARCHAR(20) NOT NULL
    ,PRIMARY KEY (brand_name)
);

CREATE TABLE Product
(
    p_id INT NOT NULL
    ,s_id INT NOT NULL
    ,brand VARCHAR(50) NOT NULL
    ,name VARCHAR(100)
    ,type VARCHAR(50)
    ,model_number VARCHAR(50)
    ,color VARCHAR(50)
    ,amount INT
    ,price INT
    ,PRIMARY KEY(p_id)
    ,FOREIGN KEY(s_id) REFERENCES store(s_id)
    ,FOREIGN KEY(brand) REFERENCES Brand(brand_name)
);

CREATE TABLE Order_item
(
    item_id INT NOT NULL
    ,p_id INT NOT NULL
    ,price INT
    ,creation_Time DATE
    ,PRIMARY KEY(item_id)
    ,FOREIGN KEY(p_id) REFERENCES Product(p_id)
);


CREATE TABLE Orders
(
    order_number INT NOT NULL
    ,payment_state VARCHAR(12)
    ,creation_time DATE
    ,total_amount INT
    ,PRIMARY KEY (order_number)
);


CREATE TABLE Comments  
(
    creation_time DATE NOT NULL
    ,user_id INT NOT NULL
    ,p_id INT NOT NULL
    ,grade FLOAT
    ,content VARCHAR(500)
    ,PRIMARY KEY(creation_time,user_id,p_id)
    ,FOREIGN KEY(user_id) REFERENCES buyers(user_id)
    ,FOREIGN KEY(p_id) REFERENCES Product(p_id)
);

CREATE TABLE Service_point
(
    s_pid INT NOT NULL
    ,streetaddr VARCHAR(40)
    ,city VARCHAR(30)
    ,province VARCHAR(20)
    ,start_time VARCHAR(20)
    ,end_time VARCHAR(20)
    ,PRIMARY KEY(s_pid)
);


-- Relationship

CREATE TABLE Save_to_Shopping_Cart
(
    user_id INT NOT NULL
    ,p_id INT NOT NULL
    ,add_time DATE
    ,quantity INT
    ,PRIMARY KEY (user_id,p_id)
    ,FOREIGN KEY(user_id) REFERENCES buyers(user_id)
    ,FOREIGN KEY(p_id) REFERENCES Product(p_id)
);


CREATE TABLE Contain
(
    order_number INT NOT NULL
    ,item_id INT NOT NULL
    ,quantity INT
    ,PRIMARY KEY (order_number,item_id)
    ,FOREIGN KEY(order_number) REFERENCES Orders(order_number)
    ,FOREIGN KEY(item_id) REFERENCES Order_item(item_id)
);


CREATE TABLE Payment
(
    order_number INT NOT NULL
    ,creditcard_number VARCHAR(25) NOT NULL
    ,pay_time DATE
    ,PRIMARY KEY(order_number,creditcard_number)
    ,FOREIGN KEY(order_number) REFERENCES Orders(order_number)
    ,FOREIGN KEY(creditcard_number) REFERENCES Credit_card(card_number)
);


CREATE TABLE Deliver_To
(
    addr_id INT NOT NULL
    ,order_number INT NOT NULL
    ,Time_delivered DATE
    ,PRIMARY KEY(addr_id,order_number)
    ,FOREIGN KEY(addr_id) REFERENCES Address(addr_id)
    ,FOREIGN KEY(order_number) REFERENCES Orders(order_number)
);


CREATE TABLE Manage
(
    user_id INT NOT NULL
    ,s_id INT NOT NULL
    ,Setup_time DATE
    ,PRIMARY KEY(user_id,s_id)
    ,FOREIGN KEY(user_id) REFERENCES sellers(user_id)
    ,FOREIGN KEY(s_id) REFERENCES Store
);



CREATE TABLE After_Sales_Service_At
(
    brand_name VARCHAR(20) NOT NULL
    ,s_pid INT NOT NULL
    ,PRIMARY KEY(brand_name, s_pid)
    ,FOREIGN KEY(brand_name) REFERENCES Brand (brand_name)
    ,FOREIGN KEY(s_pid) REFERENCES Service_point(s_pid)
);


________________________________________________________________________________________________________________________________________________________________________


-- Inserting information to the empy tables   

-- Automated Generate real-world Data by using "generatedata.com"

INSERT INTO users (user_id,name,phonenumber) VALUES (1,'Aaron Ramsdale','809-902-4957');
INSERT INTO users (user_id,name,phonenumber) VALUES (2,'Tom Roushouse','797-156-7733');
INSERT INTO users (user_id,name,phonenumber) VALUES (3,'Anne Monique','857-833-6279');
INSERT INTO users (user_id,name,phonenumber) VALUES (4,'Jason Fetters','102-490-9669');
INSERT INTO users (user_id,name,phonenumber) VALUES (5,'Michelle Hrvoj','364-220-7833');
INSERT INTO users (user_id,name,phonenumber) VALUES (6,'Pedro Chirvella','577-561-5445');
INSERT INTO users (user_id,name,phonenumber) VALUES (7,'Tom Stiller','817-736-8954');
INSERT INTO users (user_id,name,phonenumber) VALUES (8,'Lucy Erickson','500-413-5229');
INSERT INTO users (user_id,name,phonenumber) VALUES (9,'George Erickson','311-237-5037');
INSERT INTO users (user_id,name,phonenumber) VALUES (10,'Paula Newsome','501-807-7965');
INSERT INTO users (user_id,name,phonenumber) VALUES (11,'Dominic Johnson','931-805-0046');
INSERT INTO users (user_id,name,phonenumber) VALUES (12,'Boris Cummings','736-865-1874');
INSERT INTO users (user_id,name,phonenumber) VALUES (13,'Kathy Sympathy','997-968-1425');
INSERT INTO users (user_id,name,phonenumber) VALUES (14,'Dan E. Burr','554-339-3873');
INSERT INTO users (user_id,name,phonenumber) VALUES (15,'Michael Goodwin','725-145-0036');
INSERT INTO users (user_id,name,phonenumber) VALUES (16,'Jack Gray','627-635-5250');
INSERT INTO users (user_id,name,phonenumber) VALUES (17,'Miles OBrien','906-664-4111');
INSERT INTO users (user_id,name,phonenumber) VALUES (18,'Richard Tuday','308-345-2108');
INSERT INTO users (user_id,name,phonenumber) VALUES (19,'Quincy Johnson','794-251-3294');
INSERT INTO users (user_id,name,phonenumber) VALUES (20,'Brett Toomey','563-321-0004');
INSERT INTO users (user_id,name,phonenumber) VALUES (21,'Walter White','568-397-1819');
INSERT INTO users (user_id,name,phonenumber) VALUES (22,'Bryon Jackson','181-495-6507');
INSERT INTO users (user_id,name,phonenumber) VALUES (23,'Hendrick Lemarr','499-991-2743');
INSERT INTO users (user_id,name,phonenumber) VALUES (24,'Rivers Belair','619-882-8501');
INSERT INTO users (user_id,name,phonenumber) VALUES (25,'Kesha Smith','853-381-3371');
INSERT INTO users (user_id,name,phonenumber) VALUES (26,'Cooper Morgan','332-466-8999');
INSERT INTO users (user_id,name,phonenumber) VALUES (27,'Donald Regan','280-150-3915');
INSERT INTO users (user_id,name,phonenumber) VALUES (28,'Heath Englund','385-898-0420');
INSERT INTO users (user_id,name,phonenumber) VALUES (29,'Kieren Percy','768-396-9425');
INSERT INTO users (user_id,name,phonenumber) VALUES (30,'Godwin Bishop','853-688-0957');
INSERT INTO users (user_id,name,phonenumber) VALUES (31,'Ariel Lascelles','926-331-0012');
INSERT INTO users (user_id,name,phonenumber) VALUES (32,'Christoper King','661-911-8866');
INSERT INTO users (user_id,name,phonenumber) VALUES (33,'Patrick Hinge','922-755-8559');
INSERT INTO users (user_id,name,phonenumber) VALUES (34,'Maddison James','523-845-2705');
INSERT INTO users (user_id,name,phonenumber) VALUES (35,'Spencer Todd','614-499-4578');
INSERT INTO users (user_id,name,phonenumber) VALUES (36,'Tony Gellar','516-139-5882');
INSERT INTO users (user_id,name,phonenumber) VALUES (37,'Phoebe Horseman','264-976-8713');
INSERT INTO users (user_id,name,phonenumber) VALUES (38,'Mark Flynn','501-240-1875');
INSERT INTO users (user_id,name,phonenumber) VALUES (39,'Alex Summers','859-284-1514');
INSERT INTO users (user_id,name,phonenumber) VALUES (40,'Fredreick Hood','183-267-5415');
INSERT INTO users (user_id,name,phonenumber) VALUES (41,'Alan Sheringham','482-150-4868');
INSERT INTO users (user_id,name,phonenumber) VALUES (42,'Elvis Shearer','634-901-1779');
INSERT INTO users (user_id,name,phonenumber) VALUES (43,'Frank Nixon','483-164-3378');
INSERT INTO users (user_id,name,phonenumber) VALUES (44,'David Lampard','738-418-4743');
INSERT INTO users (user_id,name,phonenumber) VALUES (45,'Will Nealon','539-390-0106');
INSERT INTO users (user_id,name,phonenumber) VALUES (46,'Kevin Sandler','953-437-1177');
INSERT INTO users (user_id,name,phonenumber) VALUES (47,'Percy Savaage','640-362-9129');
INSERT INTO users (user_id,name,phonenumber) VALUES (48,'Roderick Burrows','762-486-9320');
INSERT INTO users (user_id,name,phonenumber) VALUES (49,'Brenda Hackman','375-164-3524');
INSERT INTO users (user_id,name,phonenumber) VALUES (50,'Gene Vicks','346-460-2655');
INSERT INTO users (user_id,name,phonenumber) VALUES (51,'Paul Kilter','913-377-4551');
INSERT INTO users (user_id,name,phonenumber) VALUES (52,'Tiger Forrest','693-911-2291');
INSERT INTO users (user_id,name,phonenumber) VALUES (53,'Elizabeth Mona','238-367-9905');
INSERT INTO users (user_id,name,phonenumber) VALUES (54,'Isobel Franken','284-851-0165');
INSERT INTO users (user_id,name,phonenumber) VALUES (55,'Sue Biggles','721-853-4940');
INSERT INTO users (user_id,name,phonenumber) VALUES (56,'Sergio Blaze','916-218-1512');
INSERT INTO users (user_id,name,phonenumber) VALUES (57,'Summer Crane','879-742-3407');
INSERT INTO users (user_id,name,phonenumber) VALUES (58,'Lynn Moreland','340-319-3768');
INSERT INTO users (user_id,name,phonenumber) VALUES (59,'Faith Eve','908-750-3533');
INSERT INTO users (user_id,name,phonenumber) VALUES (60,'Jakeem Lewis','801-187-8092');
INSERT INTO users (user_id,name,phonenumber) VALUES (61,'Sophie Marx','755-909-1768');
INSERT INTO users (user_id,name,phonenumber) VALUES (62,'Colby Jacobs','294-493-0304');
INSERT INTO users (user_id,name,phonenumber) VALUES (63,'Vincent Graves','217-211-8998');
INSERT INTO users (user_id,name,phonenumber) VALUES (64,'James Reece','984-206-6405');
INSERT INTO users (user_id,name,phonenumber) VALUES (65,'Calvin Hobbes','134-482-7453');
INSERT INTO users (user_id,name,phonenumber) VALUES (66,'Barbara Hannah','896-641-3132');
INSERT INTO users (user_id,name,phonenumber) VALUES (67,'Colin Freason','833-252-1580');
INSERT INTO users (user_id,name,phonenumber) VALUES (68,'Brad Coutts','618-577-5738');
INSERT INTO users (user_id,name,phonenumber) VALUES (69,'Charissa Shelton','213-729-8239');
INSERT INTO users (user_id,name,phonenumber) VALUES (70,'Laurel Moorhead','847-648-1831');
INSERT INTO users (user_id,name,phonenumber) VALUES (71,'Kathleen Douglas','956-194-4659');
INSERT INTO users (user_id,name,phonenumber) VALUES (72,'Bradley Miazaki','919-463-1871');
INSERT INTO users (user_id,name,phonenumber) VALUES (73,'Cole Depardieu','593-480-8818');
INSERT INTO users (user_id,name,phonenumber) VALUES (74,'Alvin Lookman','193-284-2494');
INSERT INTO users (user_id,name,phonenumber) VALUES (75,'Lesley Liu','593-876-6529');
INSERT INTO users (user_id,name,phonenumber) VALUES (76,'Cassandra Gray','393-826-7570');
INSERT INTO users (user_id,name,phonenumber) VALUES (77,'Alan Underwood','425-483-4304');
INSERT INTO users (user_id,name,phonenumber) VALUES (78,'Leon Bacon','281-817-4060');
INSERT INTO users (user_id,name,phonenumber) VALUES (79,'Dean Biden','444-315-3902');
INSERT INTO users (user_id,name,phonenumber) VALUES (80,'Gregg Trump','384-258-6411');
INSERT INTO users (user_id,name,phonenumber) VALUES (81,'Tatiana Conover','180-578-2636');
INSERT INTO users (user_id,name,phonenumber) VALUES (82,'Francesca Wilson','577-690-7062');
INSERT INTO users (user_id,name,phonenumber) VALUES (83,'Sonny Fister','914-931-6799');
INSERT INTO users (user_id,name,phonenumber) VALUES (84,'Xander Schumaker','871-337-1836');
INSERT INTO users (user_id,name,phonenumber) VALUES (85,'Andy Rooney','857-195-6423');
INSERT INTO users (user_id,name,phonenumber) VALUES (86,'Theo Van Grossman','412-369-2301');
INSERT INTO users (user_id,name,phonenumber) VALUES (87,'Britanney Booch','493-286-6876');
INSERT INTO users (user_id,name,phonenumber) VALUES (88,'Oliver Wang','923-883-5069');
INSERT INTO users (user_id,name,phonenumber) VALUES (89,'Wilson Young','652-797-0120');
INSERT INTO users (user_id,name,phonenumber) VALUES (90,'Fred Flint','202-685-6363');
INSERT INTO users (user_id,name,phonenumber) VALUES (91,'Taj Patel','419-663-7344');
INSERT INTO users (user_id,name,phonenumber) VALUES (92,'Beatrix Reed','990-385-6303');
INSERT INTO users (user_id,name,phonenumber) VALUES (93,'Carl Gilmore','749-575-5329');
INSERT INTO users (user_id,name,phonenumber) VALUES (94,'Jessica Robles','231-847-0873');
INSERT INTO users (user_id,name,phonenumber) VALUES (95,'Julie Hardin','606-903-9466');
INSERT INTO users (user_id,name,phonenumber) VALUES (96,'Virgina Larsen','338-386-8025');
INSERT INTO users (user_id,name,phonenumber) VALUES (97,'Gary Graham','146-582-9214');
INSERT INTO users (user_id,name,phonenumber) VALUES (98,'Adara La Rue','902-263-9357');
INSERT INTO users (user_id,name,phonenumber) VALUES (99,'Ashton V. Kunis','320-269-9789');
INSERT INTO users (user_id,name,phonenumber) VALUES (100,'Robert Ball','579-713-6386');


INSERT INTO buyers VALUES (5);
INSERT INTO buyers VALUES (41);
INSERT INTO buyers VALUES (18);
INSERT INTO buyers VALUES (12);
INSERT INTO buyers VALUES (24);
INSERT INTO buyers VALUES (16);
INSERT INTO buyers VALUES (17);
INSERT INTO buyers VALUES (85);
INSERT INTO buyers VALUES (56);
INSERT INTO buyers VALUES (66);
INSERT INTO buyers VALUES (33);
INSERT INTO buyers VALUES (28);
INSERT INTO buyers VALUES (9);

INSERT INTO sellers VALUES (1);
INSERT INTO sellers VALUES (15);
INSERT INTO sellers VALUES (30);
INSERT INTO sellers VALUES (32);
INSERT INTO sellers VALUES (61);
INSERT INTO sellers VALUES (63);
INSERT INTO sellers VALUES (10);
INSERT INTO sellers VALUES (9);
INSERT INTO sellers VALUES (4);
INSERT INTO sellers VALUES (88);






-- Automated Generate real-world Data by using "generatedata.com"

INSERT INTO address VALUES (1,28,'Haviva F. Davidson','915-791-0670','Ontario','Ottawa-Carleton','8484 Nonummy Av.','N0C 7E0');
INSERT INTO address VALUES (2,21,'Rae R. Lara','495-472-7273','Ontario','St. Catharines','5836 Iaculis Avenue','L7M 2V6');
INSERT INTO address VALUES (3,36,'Ashely O. Knowles','895-493-8279','British Columbia','Hudson''s Hope','P.O. Box 827, 1825 Fusce Ave','V7A 5A6');
INSERT INTO address VALUES (4,11,'Hollee G. Hudson','516-753-9880','Quebec','Baie-Comeau','9376 Imperdiet Street','G4J 8Y2');
INSERT INTO address VALUES (5,39,'Kylynn G. Waller','838-912-3476','Quebec','Neuville','Ap #179-5810 Nunc Rd.','G9K 8Y6');
INSERT INTO address VALUES (6,38,'Audra Manning','898-140-2501','Manitoba','Daly','732-9599 Lacinia Rd.','R1X 3Z2');
INSERT INTO address VALUES (7,9,'Zia Guzman','781-454-1244','Ontario','Cornwall','Ap #553-1602 Sit Av.','M4G 2Y2');
INSERT INTO address VALUES (8,12,'Xerxes Luna','841-769-6638','Quebec','Verdun','P.O. Box 210, 6443 Donec Road','G5L 7P4');
INSERT INTO address VALUES (9,25,'Azalia P. Hooper','116-526-3919','Quebec','Lachine','Ap #379-4986 Odio. Rd.','H3P 9J4');
INSERT INTO address VALUES (10,32,'Dahlia Rojas','916-981-2927','Ontario','Vaughan','Ap #642-6556 Adipiscing St.','L4T 4A3');
INSERT INTO address VALUES (11,11,'Melanie Duran','440-799-4382','Ontario','Tay','565-8573 Et Road','M0K 5N9');
INSERT INTO address VALUES (12,19,'Nyssa S. Maynard','861-136-6572','Prince Edward Island','Montague','P.O. Box 794, 5616 Gravida Rd.','C5Z 2Z0');
INSERT INTO address VALUES (13,38,'Hilary I. Boone','618-129-6884','British Columbia','Sooke','P.O. Box 594, 5086 At Avenue','V9W 0S9');
INSERT INTO address VALUES (14,17,'Aileen B. Pratt','785-162-9219','Quebec','Montreal','654-6775 Primis Av.','G7H 5E9');
INSERT INTO address VALUES (15,14,'Rudyard O. Kent','896-514-6693','Alberta','Wood Buffalo','271-2092 Enim. Av.','T6E 3R8');
INSERT INTO address VALUES (16,24,'Quentin Lewis','616-464-2316','Quebec','Pointe-au-Pic','P.O. Box 331, 348 Ut Rd.','J7M 7X5');
INSERT INTO address VALUES (17,33,'Alan A. Norton','229-829-6509','Ontario','Ottawa','700-385 Augue, Road','K9C 5N6');
INSERT INTO address VALUES (18,11,'Sigourney U. Stevens','206-582-2529','Alberta','Lamont','7636 Felis, Av.','T5X 9Y0');
INSERT INTO address VALUES (19,34,'Kevyn Hines','146-355-8639','Alberta','Sylvan Lake','578-8255 Amet Rd.','T4N 2R9');
INSERT INTO address VALUES (20,34,'Tyler O. Curry','111-353-8652','Quebec','Baie-Comeau','171-701 Semper Street','H3H 0J1');
INSERT INTO address VALUES (21,32,'Nola Y. Mcmahon','826-961-6244','Saskatchewan','Calder','477-5078 Dolor Street','S2X 2E7');
INSERT INTO address VALUES (22,34,'Drake Witt','464-747-5669','Nova Scotia','Pugwash','6574 Ipsum Av.','B9S 5E9');
INSERT INTO address VALUES (23,39,'Valentine Y. Peterson','175-217-1821','Alberta','Westlock','Ap #338-3056 Justo. St.','T5S 5V8');
INSERT INTO address VALUES (24,20,'Daphne Munoz','841-264-2751','Ontario','Midlands','7408 Pharetra Rd.','N8M 0B3');
INSERT INTO address VALUES (25,34,'Thomas O. Morse','700-652-8089','Saskatchewan','Estevan','P.O. Box 537, 4062 Mauris Ave','S0H 8L8');
INSERT INTO address VALUES (26,15,'Dahlia H. Fox','747-633-8010','Ontario','Russell','Ap #248-8859 Feugiat. Street','L6V 8K8');
INSERT INTO address VALUES (27,11,'Brian E. Cannon','305-973-3594','Quebec','Lévis','Ap #612-3420 Montes, Road','J4R 1Y8');
INSERT INTO address VALUES (28,13,'Cullen Vega','465-172-3435','Ontario','Burlington','P.O. Box 881, 6715 Dignissim Ave','K7M 8N4');
INSERT INTO address VALUES (29,20,'Bruce U. Blair','899-466-5745','Manitoba','Beausejour','P.O. Box 821, 8801 Diam Street','R9G 4Y7');
INSERT INTO address VALUES (30,6,'Ivan L. Barrett','626-422-8515','Ontario','St. Catharines','Ap #713-8042 Sit Street','K4N 0L5');
INSERT INTO address VALUES (31,34,'Jared X. Leonard','271-473-5902','Alberta','Rocky Mountain House','P.O. Box 900, 5389 Sagittis Avenue','T1C 1C5');
INSERT INTO address VALUES (32,37,'Daryl Terry','498-809-2944','Ontario','Quinte West','P.O. Box 960, 527 Tristique Avenue','K9C 4V9');
INSERT INTO address VALUES (33,39,'Melodie Reynolds','111-137-4809','Quebec','Valcourt','513-8244 Elit, Street','J2B 9Y6');
INSERT INTO address VALUES (34,29,'Robert Whitley','381-319-3443','Manitoba','Flin Flon','P.O. Box 896, 5501 Mauris Rd.','R6B 5B6');
INSERT INTO address VALUES (35,12,'Maggie B. Mccoy','230-943-0150','Ontario','St. Catharines','P.O. Box 996, 7765 Hendrerit Ave','N3H 8X2');
INSERT INTO address VALUES (36,32,'Isaiah X. Montoya','410-539-2283','Ontario','Grey County','274-9821 Consectetuer Road','N9X 1V2');
INSERT INTO address VALUES (37,30,'Fiona Ruiz','964-373-1028','Quebec','Dorval','Ap #396-5126 Ut Road','G1T 6B6');
INSERT INTO address VALUES (38,39,'Bree Bray','717-977-7726','Ontario','Scarborough','8565 Etiam St.','L5G 8K0');
INSERT INTO address VALUES (39,5,'TaShya Y. Buckley','779-640-3249','Quebec','Saint-Georges','Ap #881-9739 In Rd.','G0L 4E2');
INSERT INTO address VALUES (40,9,'Jason N. Contreras','454-369-2951','Quebec','Price','Ap #483-4891 In Ave','G4A 0Z4');
INSERT INTO address VALUES (41,30,'Alea A. Ortiz','717-521-9609','Alberta','Penhold','935-227 Dis St.','T4W 9W2');
INSERT INTO address VALUES (42,10,'Rhonda C. Luna','374-193-9903','Ontario','Kapuskasing','P.O. Box 990, 2280 Blandit. Rd.','K3C 7R1');
INSERT INTO address VALUES (43,18,'Ashton Sykes','687-799-5559','Prince Edward Island','Stratford','4199 Mollis. Av.','C1A 6P3');
INSERT INTO address VALUES (44,32,'Roanna Guy','412-193-7026','Quebec','Alma','2484 At St.','G0C 5W1');
INSERT INTO address VALUES (45,35,'Judah Wagner','982-952-2901','Newfoundland and Labrador','Marystown','537-9791 In St.','A0S 5J4');
INSERT INTO address VALUES (46,1,'Kimberley O. Taylor','992-637-8656','Quebec','Dubuisson','8844 Mollis Av.','J4Y 6J7');
INSERT INTO address VALUES (47,36,'Kieran Y. Sutton','239-332-3013','Alberta','Breton','Ap #980-7807 Morbi Av.','T5Y 2C4');
INSERT INTO address VALUES (48,11,'Audra Delacruz','335-263-4916','Newfoundland and Labrador','Fortune','Ap #640-8358 Nullam Rd.','A0S 1T7');
INSERT INTO address VALUES (49,5,'Lance Weeks','988-570-1631','Nova Scotia','Cape Breton Island','5297 Ante Street','B0V 6N6');
INSERT INTO address VALUES (50,15,'Lydia I. Cannon','326-839-5531','Ontario','Malahide','P.O. Box 155, 6071 Phasellus Ave','K9S 3K6');
INSERT INTO address VALUES (51,15,'Nichole M. Golden','639-480-6437','British Columbia','Kent','Ap #868-8497 Mauris Rd.','V3M 3G0');
INSERT INTO address VALUES (52,38,'Hop Bright','754-973-4196','Ontario','Caledon','P.O. Box 218, 9674 Ac Road','N1W 2Y7');
INSERT INTO address VALUES (53,11,'Slade Glenn','811-140-4603','Manitoba','Stonewall','2584 Fringilla St.','R7A 3J5');
INSERT INTO address VALUES (54,16,'Mariam A. Rodgers','869-516-3030','Ontario','Merrickville-Wolford','Ap #123-3481 Consequat Street','N0K 4W4');
INSERT INTO address VALUES (55,26,'Kareem G. Mayo','588-941-2918','Quebec','Lac-Serent','P.O. Box 310, 566 Eget Av.','J8A 9R4');
INSERT INTO address VALUES (56,27,'Donovan P. Olson','701-985-7619','Ontario','Orangeville','P.O. Box 255, 105 Ornare Ave','L5K 4G2');
INSERT INTO address VALUES (57,32,'Benedict Dejesus','896-978-9023','Quebec','Ville de Maniwaki','P.O. Box 133, 3382 Dictum Av.','J1R 7P6');
INSERT INTO address VALUES (58,26,'Brady Gibbs','269-303-3275','Ontario','Newbury','4700 Quam Road','M1A 2X2');
INSERT INTO address VALUES (59,31,'Denton H. Jenkins','661-758-1597','Ontario','Pickering','304 Luctus St.','K1V 4W0');
INSERT INTO address VALUES (60,12,'Cameron Snow','518-850-7423','British Columbia','Hope','7675 Elit. Rd.','V4N 3Y0');
INSERT INTO address VALUES (61,18,'Tanya Armstrong','483-743-4109','Quebec','Baie-Comeau','P.O. Box 718, 3678 Quisque Street','H7G 3K0');
INSERT INTO address VALUES (62,32,'Hammett Vinson','263-446-2540','British Columbia','Comox','P.O. Box 238, 9700 Sed Ave','V2W 5A1');
INSERT INTO address VALUES (63,30,'Tasha F. Johnson','984-260-8520','Quebec','Lévis','Ap #427-4974 A Rd.','G2R 1K3');
INSERT INTO address VALUES (64,29,'Shad U. Gallegos','567-187-9734','Ontario','Whitby','Ap #839-9525 Nulla Ave','K0Y 4S2');
INSERT INTO address VALUES (65,2,'Kim Parrish','439-545-6591','Manitoba','Minitonas','P.O. Box 676, 2077 Orci. Rd.','R5G 5K2');
INSERT INTO address VALUES (66,28,'Summer X. Page','883-290-9218','Saskatchewan','Lang','500-9567 Luctus Avenue','S7K 2K8');
INSERT INTO address VALUES (67,9,'Daryl Leach','301-543-7000','New Brunswick','Campbellton','P.O. Box 375, 1934 Neque Avenue','E5X 4T9');
INSERT INTO address VALUES (68,5,'Meredith Carroll','228-134-5659','British Columbia','Qualicum Beach','Ap #774-629 Enim. Rd.','V2Y 0H6');
INSERT INTO address VALUES (69,34,'Jade Black','653-593-3191','Ontario','Aurora','P.O. Box 963, 3155 Ac Avenue','N1T 2Z3');
INSERT INTO address VALUES (70,9,'Angela Head','462-990-3984','British Columbia','Mission','Ap #682-4133 Felis Road','V1A 8R6');
INSERT INTO address VALUES (71,23,'Jakeem Harvey','115-177-3031','Ontario','Merrickville-Wolford','Ap #666-9799 Ridiculus Street','K2G 5Z3');
INSERT INTO address VALUES (72,16,'Colleen M. King','506-439-2552','Quebec','Carleton','306 Ac, Road','J4V 8C1');
INSERT INTO address VALUES (73,14,'Daquan S. Sellers','115-233-3748','Quebec','Dorval','P.O. Box 918, 1473 Ac Avenue','J0E 4S5');
INSERT INTO address VALUES (74,39,'Jasmine Mercado','809-324-1682','Manitoba','Winnipeg','4965 Dui. Av.','R0Z 0P6');
INSERT INTO address VALUES (75,24,'Irene Levine','736-297-2950','Ontario','Hamilton','828-4504 In Avenue','M2T 7S8');
INSERT INTO address VALUES (76,6,'Keegan X. Webb','346-295-6332','British Columbia','Oliver','4385 Mauris Av.','V4E 5A2');
INSERT INTO address VALUES (77,9,'Iola Osborne','732-970-8724','Ontario','Guelph','765-6138 Rhoncus. Avenue','N0V 1K6');
INSERT INTO address VALUES (78,30,'Alexandra Bridges','668-956-6165','Ontario','Northumberland','Ap #430-5072 Ut Rd.','L6H 1N3');
INSERT INTO address VALUES (79,12,'Sylvester G. Dixon','296-196-1745','Ontario','Kitchener','P.O. Box 985, 8040 Mauris Avenue','K9A 2H7');
INSERT INTO address VALUES (80,25,'Hillary E. Christensen','954-617-8483','Ontario','Markham','P.O. Box 650, 8382 Amet Road','K0H 4S1');
INSERT INTO address VALUES (81,19,'Shad Grimes','745-755-7427','British Columbia','Hope','296-2991 Cras Rd.','V6J 0P0');
INSERT INTO address VALUES (82,7,'Raymond Z. Owen','976-147-0880','Quebec','Baie-Comeau','P.O. Box 595, 4902 Laoreet St.','H0W 9L6');
INSERT INTO address VALUES (83,1,'Cassady Kent','331-383-3817','Saskatchewan','Maple Creek','P.O. Box 435, 8107 Donec St.','S6M 4Z8');
INSERT INTO address VALUES (84,16,'Lee C. Cox','851-819-0204','Quebec','Labrecque','3521 Vel, Street','J5W 5C2');
INSERT INTO address VALUES (85,37,'Daniel G. Beach','221-894-7980','Ontario','Markham','4246 Praesent Rd.','P8P 9H6');
INSERT INTO address VALUES (86,10,'Justine V. Wolfe','187-940-4068','Nova Scotia','Guysborough','2185 Sem Rd.','B1N 4Y6');
INSERT INTO address VALUES (87,33,'Ruby Gutierrez','813-928-6273','Quebec','Batiscan','P.O. Box 684, 6160 Cras Road','H1J 1Z6');
INSERT INTO address VALUES (88,21,'Kitra N. Cabrera','265-914-8426','New Brunswick','Campbellton','P.O. Box 268, 4081 Suspendisse Street','E2J 3G6');
INSERT INTO address VALUES (89,11,'Astra Massey','835-156-4880','Alberta','Lethbridge','3795 Congue St.','T8B 4V4');
INSERT INTO address VALUES (90,6,'Kirby Case','742-850-9082','Alberta','Mayerthorpe','3673 Eu, Avenue','T0Z 8J1');
INSERT INTO address VALUES (91,27,'Deacon Thornton','750-890-5150','Quebec','Dorval','1795 Phasellus St.','G5E 3T1');
INSERT INTO address VALUES (92,36,'Bruno E. Potts','693-730-2896','Alberta','Picture Butte','Ap #399-7736 Vestibulum, Ave','T0P 7Z9');
INSERT INTO address VALUES (93,12,'Lyle E. Delacruz','504-478-0170','Quebec','Kirkland','5972 Velit Rd.','G9C 5S3');
INSERT INTO address VALUES (94,10,'Ira Mcguire','684-620-2873','Quebec','Dollard-des-Ormeaux','6447 Egestas. Road','J1A 7C0');
INSERT INTO address VALUES (95,29,'Halee R. Townsend','595-402-4968','British Columbia','Coquitlam','3945 Nisl. Rd.','V5H 2K2');
INSERT INTO address VALUES (96,32,'Lisandra Q. Wells','233-348-3006','Alberta','Beaumont','P.O. Box 529, 2204 Quis, St.','T9C 1P1');
INSERT INTO address VALUES (97,40,'Karina Valdez','440-133-7465','British Columbia','Fort St. John','P.O. Box 807, 7421 Praesent Rd.','V7G 3M8');
INSERT INTO address VALUES (98,12,'Farrah O. Potts','652-690-8838','Ontario','Orangeville','964-8682 Erat Rd.','L1G 0L7');
INSERT INTO address VALUES (99,9,'Eve Z. Figueroa','258-514-7449','British Columbia','Williams Lake','4890 Quis, Rd.','V4V 5N6');
INSERT INTO address VALUES (100,5,'Bruce P. Maynard','443-690-0335','Quebec','Montreal','Ap #830-7510 Eget Av.','J9G 9P2');

INSERT INTO bank_card VALUES('4023 1231 3431 8623', '2039-9-10','CIBC');
INSERT INTO bank_card VALUES('5872 8293 3321 0123', '2020-5-14','BMO');
INSERT INTO bank_card VALUES('4902 9212 3402 8831', '2027-7-01','CIBC');
INSERT INTO bank_card VALUES('5782 7293 8472 0318', '2028-8-15','CIBC');
INSERT INTO bank_card VALUES('4509 4462 9302 0716', '2030-1-30','CIBC');
INSERT INTO bank_card VALUES('8473 9299 8492 7361', '2024-6-20','BMO');
INSERT INTO bank_card VALUES('4457 4992 7391 0219', '2025-8-30','BMO');
INSERT INTO bank_card VALUES('5728 8391 7362 5381', '2035-5-20','CIBC');
INSERT INTO bank_card VALUES('7283 8982 8361 5593', '2029-4-14','BMO');
INSERT INTO bank_card VALUES('9238 2749 5738 5921', '2027-8-01','CIBC');
INSERT INTO bank_card VALUES('2839 8219 3728 2933', '2031-5-20','CIBC');

INSERT INTO credit_card VALUES('4902 9212 3402 8831',5,'VISA');
INSERT INTO credit_card VALUES('4023 1231 3431 8623',18,'MASTER');
INSERT INTO credit_card VALUES('8473 9299 8492 7361',41,'VISA');
INSERT INTO credit_card VALUES('7283 8982 8361 5593',24,'VISA');
INSERT INTO credit_card VALUES('9238 2749 5738 5921',12,'MASTER');
INSERT INTO credit_card VALUES('2839 8219 3728 2933',9,'VISA');

INSERT INTO debit_card VALUES('5872 8293 3321 0123', 15);
INSERT INTO debit_card VALUES('5728 8391 7362 5381', 30);
INSERT INTO debit_card VALUES('4457 4992 7391 0219', 32);
INSERT INTO debit_card VALUES('5782 7293 8472 0318', 1);
INSERT INTO debit_card VALUES('4509 4462 9302 0716', 3);

INSERT INTO store VALUES(8,'MucinAbut Collection','Quebec','Montreal','No.2012 Sanguinet',4,'2006-5-30');
INSERT INTO store VALUES(10,'Woolworths','British Columbia','Vancouver','No.20 ShineStreet',5,'2002-8-05');
INSERT INTO store VALUES(39,'Dixons','Quebec','Montreal','No.1023 St-Catherine',3,'2012-2-24');
INSERT INTO store VALUES(77,'The Best','Ontario','Toronto','No.3022 Saint Denis',4,'2015-7-25');
INSERT INTO store VALUES(218,'GAP','Quebec','Quebec city','No.5 Berri Street',2,'2004-11-17');


INSERT INTO Brand VALUES('Apple');
INSERT INTO Brand VALUES('Asus');
INSERT INTO Brand VALUES('Bose');
INSERT INTO Brand VALUES('Canon');
INSERT INTO Brand VALUES('DELL');
INSERT INTO Brand VALUES('GoPro');
INSERT INTO Brand VALUES('HP');
INSERT INTO Brand VALUES('Microsoft');


INSERT INTO Service_point VALUES(27,'2045 Sanguinet Street','Montreal','Quebec','10:00 am','5:30 pm');
INSERT INTO Service_point VALUES(72,'37 Sherbrook Street','Montreal','Quebec','9:30 am','5:30 pm');
INSERT INTO Service_point VALUES(34,'45 St Denis Street','Montreal','Quebec','10:00 am','6:00 pm');
INSERT INTO Service_point VALUES(19,'1099 University street','Montreal','Quebec','10:00 am','5:30 pm');
INSERT INTO Service_point VALUES(9,'27 St Catherine Street','Quebec City','Quebec','10:00 am','5:30 pm');

INSERT INTO Product VALUES(1,8,'Asus','ASUS Chromebook 11.6 laptop','laptop','C201PA-DS02','navy blue',10,262);
INSERT INTO Product VALUES(2,10,'Bose','Bose QuietComfort 35 wireless headphone','headphone','759944-0010','black',100,449);
INSERT INTO Product VALUES(3,39,'Canon','Canon EOS Rebel T5','cameras','9126B003','black',50,500);
INSERT INTO Product VALUES(4,77,'DELL','DELL Ultra HD 4k Monitor P2715Q 27-Inch Screen LED-Lit Monitor','computer accessories','P2715Q','black',40,713);
INSERT INTO Product VALUES(5,218,'GoPro','GoPro HERO5','cameras','CHDHX-501-CA','black',80,599);
INSERT INTO Product VALUES(6,218,'Microsoft','Microsoft Xbox 360 Wired Controller for Windows','controllers','52A-00004','black',60,35);
INSERT INTO Product VALUES(7,8,'Microsoft','Microsoft Sculpt Ergonomic Wireless Bluetrack Desktop Keyboard','computer accessories','L5V-00003','black',70,126);
INSERT INTO Product VALUES(8,8,'Microsoft','Microsoft Surface Pro 4 i5 (128GB) with Wireless Media Adapter','laptop','CR5-00001','black',30,1350);


INSERT INTO order_item VALUES(1,1,262,'2016-09-18');
INSERT INTO order_item VALUES(2,2,449,'2014-03-22');
INSERT INTO order_item VALUES(3,3,500,'2017-01-23');
INSERT INTO order_item VALUES(4,4,713,'2017-01-23');
INSERT INTO order_item VALUES(5,5,599,'2016-12-27');
INSERT INTO order_item VALUES(6,6,35,'2015-05-30');
INSERT INTO order_item VALUES(7,7,126,'2017-02-12');
INSERT INTO order_item VALUES(8,8,1350,'2016-12-27');
INSERT INTO order_item VALUES(9,1,262,'2015-02-13');
INSERT INTO order_item VALUES(10,5,599,'2015-08-22');

INSERT INTO Comments VALUES('2017-02-21',5,1,4.3,'The laptop works amazingly. It holds a 10 hour charge, is compact to wander with, the brightness/volume features are perfect.');
INSERT INTO Comments VALUES('2016-09-18',5,2,4.6,'These headphones are worth the money, yes even the CAD price. They sound good and the noise cancellation is incredible.');
INSERT INTO Comments VALUES('2014-03-22',12,3,4.7,'Someone always has a better camera. That being said, this is an admirable performer with enough features for most.');
INSERT INTO Comments VALUES('2017-01-23',12,4,4.8,'This monitor is simply amazing. My eyes are not getting any younger and this makes everything very crisp and clear. I can definitely notice the improvement over a 2560X1440 display. I am ordering another one!');
INSERT INTO Comments VALUES('2016-12-27',18,5,4.3,'It is the first Go Pro I have had and so far I am loving it, the voice control is great for when you have your hands busy or can not reach the buttons. The apps for camera pairing and video editing are just great as well');
INSERT INTO Comments VALUES('2015-05-30',24,6,4.5,'Works flawlessly. After plugging it in, Windows automatically installed the drivers for it, and it was working in a matter of moments. It is an actual Xbox controller so it feels solid. This was definitely a purchase I would make again.');
INSERT INTO Comments VALUES('2017-02-12',41,7,4.3,'Overall good keyboard and mouse. However the moment your USB receiver dies, the whole thing goes in the garbage.');
INSERT INTO Comments VALUES('2016-12-27',41,8,3.8,'I love my surface. I got it a couple of weeks ago. I amm a life time mac user, but I consider myself quite tech savvy. I think this is a great device.');
INSERT INTO Comments VALUES('2015-05-30',12,2,4.3,'I have been using it for a week now. For a short conclusion, i love the headset.');
INSERT INTO Comments VALUES('2015-08-22',18,1,5,'This was definitely an impulse buy on my part but has turned out to be one of the best things I have ever invested in for school!');
INSERT INTO Comments VALUES('2015-08-22',24,5,5,'First go pro I have ever purchased. Really impressed with the quality and ease of use. The stabilizer is awesome, do not need to warp stabilize a ton in adobe.');

INSERT INTO Save_to_Shopping_Cart VALUES(5,1,'2017-02-21',1);
INSERT INTO Save_to_Shopping_Cart VALUES(5,2,'2016-09-18',1);
INSERT INTO Save_to_Shopping_Cart VALUES(18,3,'2014-03-22',2);
INSERT INTO Save_to_Shopping_Cart VALUES(12,4,'2017-01-23',1);
INSERT INTO Save_to_Shopping_Cart VALUES(24,5,'2016-12-27',2);
INSERT INTO Save_to_Shopping_Cart VALUES(41,6,'2015-05-30',1);
INSERT INTO Save_to_Shopping_Cart VALUES(9,7,'2016-02-19',4);
INSERT INTO Save_to_Shopping_Cart VALUES(18,8,'2012-01-20',1)

INSERT INTO Manage VALUES(1,8,'2015-12-24');
INSERT INTO Manage VALUES(15,10,'2006-03-20');
INSERT INTO Manage VALUES(30,39,'2006-08-09');
INSERT INTO Manage VALUES(32,77,'2005-03-04');
INSERT INTO Manage VALUES(1,218,'2010-05-06');

INSERT INTO After_Sales_Service_At VALUES('Asus',27);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',27);
INSERT INTO After_Sales_Service_At VALUES('DELL',72);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',34);
INSERT INTO After_Sales_Service_At VALUES('Bose',34);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',19);
INSERT INTO After_Sales_Service_At VALUES('Canon',19);
INSERT INTO After_Sales_Service_At VALUES('Microsoft',9);
INSERT INTO After_Sales_Service_At VALUES('DELL',9);
INSERT INTO After_Sales_Service_At VALUES('GoPro',9);


INSERT INTO Orders VALUES(76023921,'Paid','2016-09-18',315);
INSERT INTO Orders VALUES(23924831,'Paid','2014-03-22',174);
INSERT INTO Orders VALUES(87291231,'Unpaid','2017-01-23',102);
INSERT INTO Orders VALUES(58293123,'Unpaid','2016-12-27',928);
INSERT INTO Orders VALUES(12992012,'Paid','2015-05-30',203);
INSERT INTO Orders VALUES(59203012,'Paid','2017-02-12',87);
INSERT INTO Orders VALUES(91027482,'Unpaid','2016-12-27',187);
INSERT INTO Orders VALUES(72839301,'Unpaid','2015-02-13',293);
INSERT INTO Orders VALUES(93042135,'Paid','2015-08-22',52);
INSERT INTO Orders VALUES(74892932,'UnPaid','2016-02-19',77);
INSERT INTO Orders VALUES(83921201,'Paid','2017-01-03',301);
INSERT INTO Orders VALUES(73919231,'Paid','2014-02-11',20);
INSERT INTO Orders VALUES(84821231,'Paid','2014-11-02',18);


INSERT INTO contain VALUES(76023921,1,1);
INSERT INTO contain VALUES(76023921,2,2);
INSERT INTO contain VALUES(23924831,3,1);
INSERT INTO contain VALUES(87291231,4,2);
INSERT INTO contain VALUES(58293123,5,1);
INSERT INTO contain VALUES(12992012,6,1);
INSERT INTO contain VALUES(12992012,7,1);
INSERT INTO contain VALUES(59203012,8,1);
INSERT INTO contain VALUES(91027482,9,1);
INSERT INTO contain VALUES(72839301,10,1);
INSERT INTO contain VALUES(93042135,1,1);
INSERT INTO contain VALUES(93042135,2,1);
INSERT INTO contain VALUES(93042135,3,1);
INSERT INTO contain VALUES(84821231,5,3);
INSERT INTO contain VALUES(73919231,6,2);
INSERT INTO contain VALUES(83921201,7,5);


INSERT INTO deliver_to VALUES(39,87291231,'2017-02-17');
INSERT INTO deliver_to VALUES(1,12992012,'2015-6-10');
INSERT INTO deliver_to VALUES(7,76023921,'2015-10-04');
INSERT INTO deliver_to VALUES(12,59203012,'2017-02-20');
INSERT INTO deliver_to VALUES(14,93042135,'2015-09-08');


INSERT INTO Payment VALUES(23924831,'4902 9212 3402 8831','2016-08-23');
INSERT INTO Payment VALUES(87291231,'4023 1231 3431 8623','2016-08-07');
INSERT INTO Payment VALUES(58293123,'8473 9299 8492 7361','2016-09-07');
INSERT INTO Payment VALUES(12992012,'7283 8982 8361 5593','2015-02-23');
INSERT INTO Payment VALUES(59203012,'9238 2749 5738 5921','2013-09-07');
INSERT INTO Payment VALUES(91027482,'4902 9212 3402 8831','2017-02-01');
INSERT INTO Payment VALUES(72839301,'4902 9212 3402 8831','2016-10-23');
INSERT INTO Payment VALUES(93042135,'4023 1231 3431 8623','2016-10-07');
INSERT INTO Payment VALUES(91027482,'7283 8982 8361 5593','2017-02-01');
INSERT INTO Payment VALUES(84821231,'9238 2749 5738 5921','2017-01-23');
INSERT INTO Payment VALUES(73919231,'9238 2749 5738 5921','2016-10-23');
INSERT INTO Payment VALUES(83921201,'9238 2749 5738 5921','2017-02-01');



___________________________________________________________________________________________________________________________________________________________________________________


--Different commands to extract information from data

-- SELECT * FROM COMMAND

-- query the address, start_time and end_time of the servicepoints in the same city as userid 5   
SELECT streetaddr,start_time,end_time
FROM Service_point
WHERE Service_point.city IN (SELECT Address.city FROM Address WHERE user_id=5);




-- query the information of laptops
SELECT *
FROM Product
WHERE type='laptop';


-- query the total quantity of products from store with storeid 8 in the shopping cart
SELECT SUM(quantity) AS total_Quantity
FROM Save_to_Shopping_Cart
WHERE save_to_shopping_cart.p_id IN (SELECT Product.p_id FROM Product WHERE s_id=8);

-- query the name and address of orders delivered on 2017-02-17
SELECT name, streetaddr, city
FROM Address
WHERE addr_id IN (SELECT addr_id FROM Deliver_To WHERE time_delivered = '2017-02-17');


 -- query the comments of product 8 
 SELECT *
 FROM comments
 WHERE p_id = 8;
 
 -- Data Modification

-- Insert the user id of sellers whose name starts with A into buyer
INSERT INTO buyers
SELECT * FROM sellers
WHERE user_id IN (SELECT user_id FROM users WHERE name LIKE 'A%');

SELECT *
FROM sellers;

-- Update the payment state of orders to unpaid which created after year 2017 and with total amount greater than 50.

SELECT *
FROM Orders
WHERE creation_time > '2017-01-01'
AND total_amount > 50;


UPDATE Orders
SET payment_state = 'Unpaid'
WHERE creation_time > '2017-01-01' AND total_amount > 50;


-- Update the name and contact phone number of address where the provice is Quebec and city is montreal.

SELECT *
FROM address
WHERE city = 'Montreal';

UPDATE address
SET name = 'Awesome Lady', contact_phoneNumber ='1234567'
WHERE province = 'Quebec' AND city = 'Montreal';


-- Delete the store which opened before year 2017

SELECT *
FROM save_to_shopping_cart
WHERE add_time < '2017-01-01';

DELETE FROM save_to_shopping_cart
WHERE add_time < '2017-01-01';



-- ------------------------------------------- --
-- Views 
-- Create view of all products whose price above average price.

CREATE VIEW Products_Above_Average_Price AS
SELECT p_id, name, price 
FROM Product
WHERE price > (SELECT AVG(price) FROM Product);


SELECT *
FROM Products_Above_Average_Price;


-- Update the view
UPDATE Products_Above_Average_Price
SET price = 1
WHERE name = 'GoPro HERO5';

-- Create view of all products sales in 2016.
CREATE VIEW Product_Sales_For_2016 AS
SELECT p_id, name, price
FROM Product
WHERE p_id IN (SELECT p_id FROM order_item WHERE item_id IN 
              (SELECT item_id FROM Contain WHERE order_number IN
               (SELECT order_number FROM Payment WHERE pay_time > '2016-01-01' AND pay_time < '2016-12-31')
              )
             );
			 
SELECT *
FROM Product_Sales_For_2016;



-- Update the view

SELECT *
FROM Product_Sales_For_2016;


UPDATE product_sales_for_2016
SET price = 200
WHERE name = 'GoPro HERO5';

-- ------------------------------------------- --
-- Check Constraints

-- Check whether the products saved to the shopping cart after the year 2017 has quantities of smaller than 10.

DROP TABLE Save_to_Shopping_Cart;
CREATE TABLE Save_to_Shopping_Cart
(
    user_id INT NOT NULL
    ,p_id INT NOT NULL
    ,add_time DATE
    ,quantity INT
    ,PRIMARY KEY (user_id,p_id)
    ,FOREIGN KEY(user_id) REFERENCES buyers(user_id)
    ,FOREIGN KEY(p_id) REFERENCES Product(p_id)
    ,CHECK (quantity <= 10 OR add_time > '2017-01-01')
);


INSERT INTO Save_to_Shopping_Cart VALUES(18,6,'2016-11-23',9);
INSERT INTO Save_to_Shopping_Cart VALUES(24,7,'2017-02-22',8);
INSERT INTO Save_to_Shopping_Cart VALUES(5,5,'2016-10-17',11); -- error

SELECT *
FROM Save_to_Shopping_Cart;


-- Check whether the ordered item has 0 to 10 quantities

DROP VIEW Product_Sales_For_2016; -- If create this view before we need to drop it first
DROP TABLE Contain;


CREATE TABLE Contain
(
    order_number INT NOT NULL
    ,item_id INT NOT NULL
    ,quantity INT CHECK(quantity > 0 AND quantity <= 10)
    ,PRIMARY KEY (order_number,item_id)
    ,FOREIGN KEY(order_number) REFERENCES Orders(order_number)
    ,FOREIGN KEY(item_id) REFERENCES Order_item(item_id)
);

SELECT order_number
FROM orders;

INSERT INTO Contain VALUES (93042135, 2, 9);
INSERT INTO Contain VALUES (76023921, 1, 7);

SELECT * 
FROM contain;



______________________________________________________________________________________________________________________________________________________________________________


-- Creating index 


create index Service_pointCity on Service_point(city);
-- queries the address, starttime and endtime of the servicepoints in the same city as a particular user    

SELECT *
FROM Service_pointCity;

CREATE VIEW Service_Point_City AS
SELECT streetaddr,start_time,end_time
FROM Service_Point
WHERE Service_Point.city IN (SELECT Address.city FROM Address WHERE user_id=5);

SELECT *
FROM Service_Point_City;


_______________________________________________________________________________________________________________________________________________________________________________





-- Create Functions
-- STORED PROCEDURE
-- Compute the average amount of product of a brand and then use it to modify the quantity of product specified by user the in save_to_shopping_cart relation
CREATE FUNCTION func1 (vp_id integer, vbrand character varying) RETURNS integer
	LANGUAGE plpgsql
AS $$
DECLARE
v_amount INTEGER;
C1 CURSOR FOR SELECT AVG(amount) FROM product WHERE brand = vbrand;
BEGIN
OPEN C1;
FETCH C1 INTO v_amount;
UPDATE save_to_shopping_cart SET quantity = v_amount WHERE pid = vpid;
RETURN v_amount;
CLOSE C1;
END
$$

-- EXECUTE
SELECT func1(8,'Microsoft');

UPDATE save_to_shopping_cart SET quantity = 1 where p_id = 8;

-- TRIGGER PROCEDURE
CREATE TABLE shoppingcart_audits(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  p_id INT NOT NULL,
  quantity INT NOT NULL,
  changed_on TIMESTAMP(6) NOT NULL
);


CREATE OR REPLACE FUNCTION shoppingcart_quantity_changes()
  RETURNS TRIGGER AS $$
BEGIN
  IF NEW.quantity <> OLD.quantity THEN
    INSERT INTO shoppingcart_audits (user_id, p_id, quantity,changed_on)
    VALUES ( OLD.user_id, OLD.p_id, OLD.quantity, now());
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER quantity_changes
  BEFORE UPDATE
  ON save_to_shopping_cart
  FOR EACH ROW
  EXECUTE PROCEDURE shoppingcart_quantity_changes();

