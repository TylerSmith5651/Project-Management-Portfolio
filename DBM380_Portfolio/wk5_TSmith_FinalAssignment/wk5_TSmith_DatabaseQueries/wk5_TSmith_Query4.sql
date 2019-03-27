SELECT Item_SKU, inventory_list.Item_Name, Item_Description
FROM inventory_list
INNER JOIN item_description ON item_description.Item_Name=inventory_list.Item_Name;
-- Creates a list of names and descriptions for all items in the store