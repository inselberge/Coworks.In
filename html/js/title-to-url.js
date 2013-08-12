/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 6/13/13
 * Time: 1:28 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
$(document).ready(function ($){
        $(".item-title").blur(function (){
            var $this=$(this);
            //$(".item-url").val("http://geekdom.com/events/"+$this.val().trim().replace(/ /g,"-"));
            $(".item-url").val("http://members.geekdom.com/event/"+$this.val().toLowerCase().replace(/-+/,"-").replace(/ /g,"-").trim().replace(/ +/, " ").replace(/[^A-Za-z0-9-]/,' '));
        });
});