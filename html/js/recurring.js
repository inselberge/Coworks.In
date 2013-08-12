/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 6/16/13
 * Time: 4:41 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
$(document).ready(function ($){
    $("#recurring").on("change",function(){
        if($("#recurring").val()>1){
            $("#recurring-follow-up").show();
        } else {
            $("#recurring-follow-up").hide();
        }
    });
});