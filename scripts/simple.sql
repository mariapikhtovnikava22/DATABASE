SELECT * FROM Sizes;

SELECT * FROM Pizzas
LIMIT 2 OFFSET 3;

SELECT * FROM Users
WHERE Username LIKE 'mar%5';

SELECT Username, Address,PhoneNumber FROM Users
WHERE PhoneNumber LIKE '%5';

SELECT * FROM Users
WHERE Email LIKE '%@bsuir.by';

SELECT * FROM Users
WHERE Email GLOB '*_*@mail.ru';

SELECT DISTINCT Name FROM Pizzas;

SELECT Price,Name FROM Pizzas
WHERE Price BETWEEN 5 AND 7;

SELECT Price,Name FROM Pizzas
WHERE Price IN (2,3,4);

SELECT Price,Name FROM Pizzas
WHERE Price IN (2,3,4)
LIMIT 2 OFFSET 1;

SELECT Price FROM Prices
WHERE PromoId IS NOT NULL;

SELECT Price FROM Prices
WHERE PromoId IS NULL;



