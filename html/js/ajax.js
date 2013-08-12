/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 7/1/13
 * Time: 10:48 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
$(document).ready(function($){
    $.ajaxSetup ({
        cache: false
    });

    var ajax_load = "<img src='../image/load.gif' alt='loading...' />";

    //	load() functions
    var baseUrl = "includes/core_class/checkValue.php?v=";
/*
    $("#load_basic").click(function(){
        $("#result").html(ajax_load).load(loadUrl);
    });
*/
    $(".ajax").blur(
        function (){
            var $this = $(this);
            var statusID='#live-'+$this.attr('id');

            if($this.data("input-type") === 'password'){
                loadUrl=baseUrl+$this.val()+"&t=2";
            }
            if($this.data("input-type") === 'name'){
                loadUrl=baseUrl+$this.val()+"&t=3";
            }
            if($this.data("input-type") === 'city'){
                loadUrl=baseUrl+$this.val()+"&t=4";
            }
            if($this.data("input-type") === 'state'){
                loadUrl=baseUrl+$this.val()+"&t=5";
            }
            if($this.data("input-type") === 'zip'){
                loadUrl=baseUrl+$this.val()+"&t=6";
            }
            if($this.data("input-type") === 'email'){
                loadUrl=baseUrl+$this.val()+"&t=31";
            }
            if($this.data("input-type") === 'address'){
                loadUrl=baseUrl+$this.val()+"&t=9";
            }
            if($this.data("input-type") === 'comment'){
                loadUrl=baseUrl+$this.val()+"&t=10";
            }
            if($this.data("input-type") === 'month'){
                loadUrl=baseUrl+$this.val()+"&t=11";
            }
            if($this.data("input-type") === 'year'){
                loadUrl=baseUrl+$this.val()+"&t=12";
            }
            if($this.data("input-type") === 'day'){
                loadUrl=baseUrl+$this.val()+"&t=13";
            }
            if($this.data("input-type") === 'hour'){
                loadUrl=baseUrl+$this.val()+"&t=14";
            }
            if($this.data("input-type") === 'minute'){
                loadUrl=baseUrl+$this.val()+"&t=15";
            }
            if($this.data("input-type") === 'website'){
                loadUrl=baseUrl+$this.val()+"&t=16";
            }
            if($this.data("input-type") === 'phone'){
                loadUrl=baseUrl+$this.val()+"&t=18";
            }
            if($this.data("input-type") === 'date'){
                loadUrl=baseUrl+$this.val()+"&t=19";
            }
            if($this.data("input-type") === 'time'){
                loadUrl=baseUrl+$this.val()+"&t=20";
            }
            if($this.data("input-type") === 'positive-integer'){
                loadUrl=baseUrl+$this.val()+"&t=21";
            }
            if($this.data("input-type") === 'negative-integer'){
                loadUrl=baseUrl+$this.val()+"&t=22";
            }
            if($this.data("input-type") === 'integer'){
                loadUrl=baseUrl+$this.val()+"&t=23";
            }
            if($this.data("input-type") === 'positive-float'){
                loadUrl=baseUrl+$this.val()+"&t=24";
            }
            if($this.data("input-type") === 'negative-float'){
                loadUrl=baseUrl+$this.val()+"&t=25";
            }
            if($this.data("input-type") === 'float'){
                loadUrl=baseUrl+$this.val()+"&t=26";
            }
            if($this.data("input-type") === 'IPv4'){
                loadUrl=baseUrl+$this.val()+"&t=27";
            }
            if($this.data("input-type") === 'no-input'){
                loadUrl=baseUrl+$this.val()+"&t=28";
            }
            if($this.data("input-type") === 'only-blanks'){
                loadUrl=baseUrl+$this.val()+"&t=29";
            }
            if($this.data("input-type") === 'return-lines'){
                loadUrl=baseUrl+$this.val()+"&t=30";
            }
            if($this.data("input-type") === 'birthday'){
                loadUrl=baseUrl+$this.val()+"&t=32";
            }
            $.get(loadUrl,function(data){
                $(statusID).html(data);
                if($this.data("input-type") === 'zip'){
                    //Get the information not provided by the user directly
                }
            });
        }
    );
});