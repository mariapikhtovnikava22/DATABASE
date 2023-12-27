CREATE OR REPLACE PROCEDURE add_pizza_to_cart(_pizzaid INTEGER, _orderid INTEGER, _count INTEGER DEFAULT 1) 
AS $$
BEGIN
	IF (EXISTS(SELECT * FROM  orderitems AS cart 
			   WHERE cart.orderid = _orderid AND cart.pizzaid = _pizzaid)) THEN
    	UPDATE orderitems SET "count" = "count" + _count WHERE "orderid" = _orderid AND "pizzaid" = _pizzaid;
	ELSE
		INSERT INTO orderitems (count, pizzaid, orderid) 
		VALUES (_count, _pizzaid, _orderid);
	END IF;
END;
$$ LANGUAGE plpgsql;

call add_pizza_to_cart(3,2);



CREATE OR REPLACE PROCEDURE add_ingredients_to_pizza(_pizza_id INTEGER, _ingredients_id INTEGER) 
AS $$
BEGIN
	IF NOT (EXISTS(SELECT * FROM pizzaingredients AS pi 
			   WHERE pi.pizzaid = _pizza_id AND pi.ingredientid = _ingredients_id)) THEN
    	INSERT INTO pizzaingredients (pizzaid, ingredientid) 
		VALUES (_pizza_id, _ingredients_id);
	END IF;
END;
$$ LANGUAGE plpgsql;

call add_ingredients_to_pizza(3,1);

CREATE OR REPLACE PROCEDURE add_order(_username VARCHAR(64))
AS $$
DECLARE
	orderitems_id INTEGER;
BEGIN
	INSERT INTO orders (username)
    VALUES (_username)
    RETURNING id INTO orderitems_id;
END;
$$ LANGUAGE plpgsql;

call add_order('mary');