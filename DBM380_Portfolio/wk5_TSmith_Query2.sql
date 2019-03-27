SELECT Item_Name 
FROM Inventory_List, Order_Creation
WHERE order_creation.Suggested_Volume < order_creation.Item_Volume;
-- Chooses which items are below their suggested volume