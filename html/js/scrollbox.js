/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 7/3/13
 * Time: 10:36 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
$('document').ready(function(){
    updatestatus();
    scrollalert();
});
function updatestatus(){
    //Show number of loaded items
    var totalItems=$('.scrollbox-content section').length;
    $('.scrollbox-status').text('Loaded '+totalItems+' Items');
}
function scrollalert(){
    var scrolltop=$('.scrollbox').attr('scrollTop');
    var scrollheight=$('.scrollbox').attr('scrollHeight');
    var windowheight=$('.scrollbox').attr('clientHeight');
    var scrolloffset=20;
    if(scrolltop>=(scrollheight-(windowheight+scrolloffset)))
    {
        //fetch new items
        $('.scrollbox-status').text('Loading more items...');
        $.get('new-items.html', '', function(newitems){
            $('.scrollbox-content').append(newitems);
            updatestatus();
        });
    }
    setTimeout('scrollalert();', 500);
}