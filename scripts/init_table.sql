INSERT INTO Roles (Name) VALUES
("Courier"),
("Clients"),
("Admin");

INSERT INTO Sizes (Diametr) VALUES
("Small"),
("Medium"),
("Large");

INSERT INTO PizzaIngredients (PizzaId, IngredientId) VALUES
(1,1),
(1,2),
(5,3),
(7,5),
(7,2);

INSERT INTO OrderItems (Count, PizzaId,OrderId) VALUES
(2,1,1),
(3,3,2),
(1,3,3),
(1,4,3),
(1,7,3);

INSERT INTO Orders (Username, StateId,PriceId) VALUES
("mary",4,1),
("bob",3,2),
("Jhon",1,3);

INSERT INTO Prices (Price) VALUES
(9),
(14),
(16);

INSERT INTO Prices (Price,PromoId) VALUES
(25,1),
(15,3);

INSERT INTO States (Name) VALUES
("accept"),
("prepare"),
("ready");

INSERT INTO States (Name) VALUES
("cart");

INSERT INTO Promocodes (Name, Code) VALUES
("FIRST ORDER", 1545),
("FREE DELIVERY", 2367),
("HOT MONDAY", 1189);


INSERT INTO Ingredients (Name) VALUES
("cucmber"),
("hum"),
("olive"),
("mushroom"),
("cheese"),
("chicken");

INSERT INTO Reviews (Text,Time, PizzaId, UserId) VALUES
("Самая лучшая пиццерия в мире","12.01.2022 13:45",1,1),
("Вкусная пицца и доброжелательный персонал","14.10.2021 10:15",3,4);


INSERT INTO Users (Username, Password, PhoneNumber, Email, Address, FirstName, LastName, RoleId) VALUES
("mary","qwerty","+375295355770","mar@mail.ru", "Леонида Беды 4", "Мария", "Пихтовникова",2),
("admin","qwerty","+375445588744","pizzer@mail.ru", "Сурганово 50", "Мила", "Гращенко",3),
("Jhon","qwerty","+375298968966","hot_man@mail.ru", "Сурганово 50", "Евгений", "Цвык",1),
("bob","qwerty","+375334562345","bob@mail.ru", "Независимости 14", "Борис", "Судак", 2);


INSERT INTO Pizzas (Name, Price, Photo, SizedId) VALUES
("Burger",4,"D:\PIZZERIA\pizzaPhoto\burger.png",1),
("Cheese",5,"D:\PIZZERIA\pizzaPhoto\cheese_pizza.png",2),
("Chiken_Ranch",7,"D:\PIZZERIA\pizzaPhoto\chiken_ranch.png",3),
("Exotic",3,"D:\PIZZERIA\pizzaPhoto\exotic.png",1),
("Italian",7,"D:\PIZZERIA\pizzaPhoto\italian.png",3),
("Italian_chiken",4,"D:\PIZZERIA\pizzaPhoto\italian_chicken.png",1),
("FourSeason",6,"D:\PIZZERIA\pizzaPhoto\four_season.png",2),
("Burger",5,"D:\PIZZERIA\pizzaPhoto\burger.png",2),
("HamMashrooms",5,"D:\PIZZERIA\pizzaPhoto\burger.png",2),
("Burger",7,"D:\PIZZERIA\pizzaPhoto\burger.png",3);
