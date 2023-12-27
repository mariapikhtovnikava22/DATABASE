INSERT INTO Roles (name) VALUES
('Courier'),
('Clients'),
('Admin');

INSERT INTO Sizes (Diametr) VALUES
('Small'),
('Medium'),
('Large');

INSERT INTO Ingredients (Name) VALUES
('cucmber'),
('hum'),
('olive'),
('mushroom'),
('cheese'),
('chicken');

INSERT INTO Pizzas (Name, Price, SizesId) VALUES
('Burger',4,1),
('Cheese',5,2),
('Chiken_Ranch',7,3),
('Exotic',3,1),
('Italian',7,3),
('Italian_chiken',4,1),
('FourSeason',6,2),
('Burger',5,2),
('HamMashrooms',5,2),
('Burger',7,3);

INSERT INTO PizzaIngredients (PizzaId, IngredientId) VALUES
(1,1),
(1,2),
(5,3),
(7,5),
(7,2);

INSERT INTO States (Name) VALUES
('accept'),
('prepare'),
('ready');

INSERT INTO States (Name) VALUES
('cart');

INSERT INTO Prices (Price) VALUES
(9),
(14),
(16);

INSERT INTO Promocodes (Name, Code) VALUES
('FIRST ORDER', 1545),
('FREE DELIVERY', 2367),
('HOT MONDAY', 1189);

INSERT INTO Prices (Price,PromoId) VALUES
(25,1),
(15,3);

INSERT INTO Orders (Username, StateId,PriceId) VALUES
('mary',4,1),
('bob',3,2),
('Jhon',1,3);

INSERT INTO OrderItems (Count, PizzaId,OrderId) VALUES
(2,1,1),
(3,3,2),
(1,3,3),
(1,4,3),
(1,7,3);


INSERT INTO Users (Username, Password, PhoneNumber, Email, Address, FirstName, LastName, RoleId) VALUES
('mary','qwerty','+375295355770','mar@mail.ru', 'Леонида Беды 4', 'Мария', 'Пихтовникова',2),
('admin','qwerty','+375445588744','pizzer@mail.ru', 'Сурганово 50', 'Мила', 'Гращенко',3),
('Jhon','qwerty','+375298968966','hot_man@mail.ru', 'Сурганово 50', 'Евгений', 'Цвык',1),
('bob','qwerty','+375334562345','bob@mail.ru', 'Независимости 14', 'Борис', 'Судак', 2);

INSERT INTO Users (Username, Password, PhoneNumber, Email, Address, FirstName, LastName, RoleId) VALUES
('mar2345','qwerty','+375295355770','mar@bsuir.by', 'Леонида Беды 4', 'Мария', 'Пихтовникова',2);


INSERT INTO Reviews (Text,Time, PizzaId, UserId) VALUES
('Самая лучшая пиццерия в мире','2022-10-30 13:45:00',1,1),
('Вкусная пицца и доброжелательный персонал','2021-9-12 10:34:00',3,4);


