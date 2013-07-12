<?php 
require_once MYSQL_BROWSE; 
/**
 * @param      $dbc
 * @param null $argsMySQL
 * @return bool
 */
function browseEvent_Room( $dbc, $argsMySQL = null )
{
    if ( isset($dbc) ) {
        if ( isset($argsMySQL) AND !is_null($argsMySQL) ) {
            $q = "SELECT * FROM viewEvent_Room " . $argsMySQL;
        } else {
            $q = "SELECT * FROM viewEvent_Room";
        }
        $b_result = mysqli_query($dbc, $q);
        $rows = mysqli_affected_rows($dbc);
        if ( $rows > 0 ) {
            //create tableBuilder object
            include_once CORE_CLASS . "tableBuilder.php";
            try {
                $tb = new tableBuilder($dbc, $b_result, "browseEvent_Room");
                $tb->execute();
            } catch ( Exception $e ) {
                echo utf8_encode(date("Y-m-d H:i:s") . " " . $e);
                return false;
            }
        } else {
            echo "It appears that we could not find any data for your request.";
        }
    } else {
        echo "Your database connection has not been set correctly";
    }
    return true;
}

