CREATE VIEW IF NOT EXISTS  users_orders AS
SELECT Orders.UserName AS user,
       COUNT(*) AS count_orders,
       SUM(OrderItems.Count) AS PizzaCount,
       SUM(Prices.Price) As total_price
   FROM Orders
   JOIN Prices ON Orders.PriceId = Prices.id
   JOIN OrderItems ON Orders.id = OrderItems.OrderId
   GROUP BY user;
       
SELECT * FROM users_orders;

CREATE VIEW IF NOT EXISTS users_pizzas AS
SELECT Orders.UserName AS user,
       Pizzas.Name AS pizza
   FROM Orders 
   JOIN OrderItems ON Orders.id = OrderItems.OrderId
   JOIN Pizzas ON Pizzas.id = OrderItems.PizzaId; 
   
DROP VIEW users_pizzas;
   
SELECT * FROM users_pizzas;  

        