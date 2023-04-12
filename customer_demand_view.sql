CREATE VIEW Customer_Demand_And_Inventory AS
SELECT 
    t.item_id, 
    t.item_name, 
    SUM(oli.Quantity) AS CustomerDemand
FROM 
    items t
    JOIN order_line_items oli ON t.item_id = oli.item_id
    JOIN customer_order co ON oli.order_id = co.order_id
GROUP BY 
    t.item_id, 
    t.item_name
