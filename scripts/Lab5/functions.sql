CREATE OR REPLACE FUNCTION get_pizzas_by_size(size_name VARCHAR(64))
RETURNS TABLE(id INTEGER, sizes VARCHAR(64), name VARCHAR(64), price REAL) AS $$
BEGIN 
	RETURN QUERY SELECT 
	Pizzas.id,
	Sizes.Diametr AS sizes,
	Pizzas.name, 
	Pizzas.Price
	
	FROM Pizzas 
	JOIN Sizes ON SizesId = Sizes.id
	WHERE sizes.Diametr = size_name
	ORDER BY Price DESC;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_pizzas_by_size('Small');