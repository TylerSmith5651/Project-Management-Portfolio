SELECT inventory_list.Item_SKU, order_creation.Suggested_Volume, Item_Volume
FROM order_creation
INNER JOIN inventory_list ON inventory_list.Suggested_Volume=order_creation.Suggested_Volume;
-- Creates a list that compares our current stock to the suggested volume of that stock