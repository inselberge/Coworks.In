<?php
/**
 * Created by JetBrains PhpStorm.
 * Project: Members.Geekdom
 * User: Carl "Tex" Morgan
 * Date: 7/2/13
 * Time: 1:14 AM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
function escape_data($data){
    if ( get_magic_quotes_gpc() ) {
        $data = stripslashes($data);
    }
    if(isset($dbcUser)){
        return mysqli_real_escape_string($dbcUser, trim($data));
    } elseif(isset($dbcBrowse)){
        return mysqli_real_escape_string($dbcBrowse, trim($data));
    } elseif(isset($dbcPwrUser)){
        return mysqli_real_escape_string($dbcPwrUser, trim($data));
    } elseif(isset($dbcAdm1n)){
        return mysqli_real_escape_string($dbcAdm1n, trim($data));
    } else {
        return false;
    }
}