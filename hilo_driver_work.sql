CREATE VIEW Assigned_Work_To_HiLo AS
SELECT 
    wo.work_order_id, 
    wo.product_id, 
    hd.driver_name
FROM 
    work_order wo
    JOIN trip_plans tp ON wo.trip_id = tp.trip_id
    JOIN hilo_drivers hd ON hd.driver_id = tp.driver_id
