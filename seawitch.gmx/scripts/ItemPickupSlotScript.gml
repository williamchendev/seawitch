//Item Pickup Slot Script
if (global.inventoryslot[argument1] == -1)
{
    global.inventoryslot[argument1] = argument0;
    return(true);
}
return(false);
