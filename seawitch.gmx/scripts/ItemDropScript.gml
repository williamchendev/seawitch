//Drops the item from the inventory
for (i = 0; i < 18; i++){
    if (global.inventoryslot[i] == argument0) //if slot "i" contains argument0
    {
        global.inventoryslot[i] = -1;
        return(true);
    }
}
return(false);
