//Picks up item
for (i = 0; i < 18; i++){
    if (global.inventoryslot[i] == -1){
        global.inventoryslot[i] = argument0;
        return(true);
    }
}
return(false);
