//Item Slot Drop
if (global.inventoryslot[argument0] != -1)
{
    global.inventoryslot[argument0] = -1;
    return(true);
}
return(false);
