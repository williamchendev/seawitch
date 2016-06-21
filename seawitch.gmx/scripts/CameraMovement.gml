///Camera Movement
cameraxface = 32;
cameraysnap = 32;
cameraspeed = 0.05;

if (!cutscene){
    //Move Camera
    view_xview += (((x + (image_xscale * cameraxface)) - (view_wview / 2)) - view_xview) * cameraspeed;
    view_yview += (((y - cameraysnap) - (view_hview / 2)) - view_yview) * cameraspeed;
}
else{
    view_xview += (((regionx) - (view_wview / 2)) - view_xview) * cameraspeed;
    view_yview += (((regiony) - (view_hview / 2)) - view_yview) * cameraspeed;
}

