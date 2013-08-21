<?php
if ( isset($_GET['e']) ) {
    $edit_mode = escape_data($_GET['e']);
} else {
    $edit_mode = false;
}
if ( isset($_GET['id']) ) {
    $the_id = escape_data($_GET['id']);
} else {
    $the_id = false;
}
if ( isset($_GET['l']) ) {
    $list_mode = escape_data($_GET['l']);
} else {
    $list_mode = false;
}
if ( isset($_SESSION['user_id']) AND !is_null($_SESSION['user_id']) ) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = false;
}
if ( isset($_SESSION['user_type']) AND !is_null($_SESSION['user_type']) ) {
    $user_type = $_SESSION['user_type'];
} else {
    $user_type = false;
}
if ( isset($_SESSION['location_id']) AND !is_null($_SESSION['location_id']) ) {
    $location_id = $_SESSION['location_id'];
} else {
    $location_id = false;
}
if ( isset($_SESSION['location_status_id']) AND !is_null($_SESSION['location_status_id']) ) {
    $location_status_id = $_SESSION['location_status_id'];
} else {
    $location_status_id = false;
}
/**
 * @param $name
 * @return null
 */
function reqpostcheck( $name )
{
    if ( isset($name) ) {
        if ( isset($_POST["$name"]) AND !is_null($_POST["$name"]) AND strlen($_POST["$name"]) > 0 ) {
            echo $_POST["$name"];
        } elseif ( isset($_GET["$name"]) AND !is_null($_GET["$name"]) AND strlen($_GET["$name"]) > 0 ) {
            echo $_GET["$name"];
        } else {
            //echo NULL;
        }
    } else {
        return null;
    }
}