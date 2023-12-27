SELECT Name, Price FROM Pizzas
WHERE Price BETWEEN 1 AND 6
ORDER BY Name ASC, Price DESC;


SELECT COUNT(*) AS sort_by_id, Name, SUM(Price) AS totalPriceInList
FROM Pizzas 
WHERE Name = 'Burger' OR Name = 'Italian'
GROUP BY Name
ORDER BY sort_by_id;


-- PARTITION -- 
--Важное отличие заключается в том, что GROUP BY агрегирует данные и сокращает количество строк, 
--в то время как PARTITION BY оставляет исходное количество строк, 
--но позволяет вычислять агрегатные значения для каждой строки внутри своей группы. --

SELECT Name,AVG(Price) OVER (PARTITION BY Name) AS total_price FROM Pizzas;

-- JOIN--

    -- GET PIZZAS AND THEIRS INGREDIENTS --

SELECT Pizzas.Name AS PizzaName, Ingredients.Name AS IngredientName
FROM Pizzas
JOIN PizzaIngredients  ON Pizzas.Id = PizzaIngredients.PizzaId
JOIN Ingredients ON PizzaIngredients.IngredientId = Ingredients.Id;


     --SOME SORTING WITH PIZZAS AND THIER SIZES--
 
SELECT Sizes.Diametr AS size, Name, Price
FROM Pizzas JOIN Sizes ON SizeId = Sizes.id;

SELECT Sizes.Diametr AS size, Name, Price
FROM Pizzas JOIN Sizes ON SizeId = Sizes.id
WHERE size = 'Small'
ORDER BY Price DESC;

SELECT Sizes.Diametr AS size, COUNT(*) AS sort_by_id, SUM(Price) AS total_price
FROM Pizzas JOIN Sizes ON SizeId = Sizes.id
GROUP BY Sizes.Diametr
HAVING COUNT(*) > 1
ORDER BY sort_by_id;


-- USING SOME TYPES OF JOIN -- 

-- INNER JOIN - DEFAUL JOIN -- 

SELECT Roles.Name as name, COUNT(*) AS count
FROM Users
INNER JOIN Roles ON Users.RoleId = Roles.id
GROUP BY name;

-- OUTER JOIN --

    -- LEFT OUTER JOIN - ALL ROWS FROM
    -- THE LEFT TABLE ARE 
    --INCLUDED EVEN IF NOTHING MATCHES FOR
    -- THEM FROM THE RIGHT TABLE--

SELECT Id AS order_number, States.Name
FROM Orders
LEFT OUTER JOIN States ON Orders.StateId = States.id;

    -- RIGHT --

SELECT Id AS order_number, States.Name
FROM Orders
RIGHT OUTER JOIN States ON Orders.StateId = States.id;

     -- FULL -- 
 
SELECT Id AS order_number, States.Name
FROM Orders
FULL OUTER JOIN States ON Orders.StateId = States.id;

    -- CROSS JOINT--

SELECT Id AS order_number, States.Name
FROM Orders
CROSS JOIN States;

-- ПОДЗАПРОСЫ --

SELECT Name, Price 
FROM Pizzas 
WHERE Price = (SELECT MAX(price) FROM Pizzas);

    -- ПИЦЦЫ КОТОРЫЕ БЫЛИ ЗАКАЗАНЫ ХОТЯ БЫ ОДИН РАЗ --

SELECT Name,Price, Sizes.Diametr AS Size 
FROM Pizzas
JOIN Sizes ON Pizzas.SizeId = Sizes.id
WHERE Pizzas.id IN (SELECT PizzaId FROM OrderItems);

    -- Пиццы которые были заказаны больше одного раза -- 
SELECT Name,Price, Sizes.Diametr AS Size 
FROM Pizzas
JOIN Sizes ON Pizzas.SizeId = Sizes.id
WHERE Pizzas.id IN (SELECT PizzaId 
                    FROM OrderItems 
                    GROUP BY PizzaId
                    HAVING COUNT(*) > 1);
                    

    --ADD New Order -- 

INSERT INTO Orders (UserName, StateId, PriceId) VALUES
('mary',(SELECT id FROM States WHERE States.Name = 'cart'), 3);

-- EXISTS -- 

-- Проверяет, возвращает ли подзапрос какое-либо значение--
-- Возвращает либо 1 либо 0--

SELECT 
    EXISTS(SELECT Name FROM Pizzas WHERE Name = 'Sap') AS sap,
    EXISTS(SELECT Price FROM Prices WHERE Price BETWEEN 1 AND 10) AS price;

SELECT Name AS state_name FROM States
WHERE NOT EXISTS(SELECT StateId FROM Orders WHERE States.id = StateId);

 
-- UNION -- 
SELECT UserName,Prices.Price * 0.3 AS price FROM Orders
JOIN Prices ON Orders.PriceId = Prices.id
WHERE price > 10
UNION SELECT UserName, Prices.Price * 0.1 AS price FROM Orders
JOIN Prices ON Orders.PriceId = Prices.id
WHERE price < 10;

--CASE--
    -- РЕЙТИНГ ПИЦЦ -- 
SELECT Pizzas.Name, COUNT(*) AS count_order, 
CASE 
    WHEN SUM(Count) = 1
        THEN 'Not popular'
    WHEN SUM(Count) BETWEEN 2 AND 4
        THEN 'Popular'
    WHEN SUM(Count) > 5
        THEN 'Very Popular'
END AS count_pizzas
FROM OrderItems
JOIN Pizzas ON Pizzas.id = OrderItems.PizzaId
GROUP BY PizzaId;



  