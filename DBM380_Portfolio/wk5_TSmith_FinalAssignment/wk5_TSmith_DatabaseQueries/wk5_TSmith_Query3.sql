SELECT Item_Name
FROM inventory_list, order_creation
WHERE order_creation.Item_Volume = 0;
-- Creates a list of items that we are out of.