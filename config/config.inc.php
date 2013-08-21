<?php
$live = FALSE;
/* TODO: change this so it set on different coworking spaces, not just Geekdom
 * Global Emails
 */
$contact_email = "errors@coworks.in";
$notify_email = "no-reply@coworks.in";
/*
 * Logging Settings
 */
$logDatabaseErrors=true;
$logDatabaseWarnings=true;
$logSystemError=true;
$logSystemWarning=true;
if($live){
    $logDatabaseBackup=true;
    $logDatabaseQueries=true;
    $logSystemEmail=true;
    $logSystemMalicious=true;
    $logSystemVirus=true;
} else {
    $logDatabaseBackup=false;
    $logDatabaseQueries=false;
    $logSystemEmail=false;
    $logSystemMalicious=false;
    $logSystemVirus=false;
}
/*
 * Start our session
 */
session_start();
if(!isset($_SESSION["coworking_space_id"])){
    //TODO: change this so it sets on different coworking spaces, not just Geekdom
    $_SESSION["coworking_space_id"]=1;
}
/*
 * Application Specific Constants
 */
include_once "Coworks.In.config.inc.php";
/*
 * Minos Database Constant
 */
define('MYSQL_MINOS',DATABASE_CONNECTIONS."mysql_Minos.inc.php");
/*
 * Set up our database connections for ease of use.
 */
require_once MYSQL_MINOS;
require_once MYSQL;
require_once MYSQL_BROWSE;
/*
 * Include our global helpers
 */
include_once INC_PHP."edit_mode.inc.php";
include_once CORE_CLASS."preLoader.php";
include_once CORE_CLASS."checkInput.php";
/*
 * Errors and Exceptions
 */
function my_error_handler( $e_number, $e_message, $e_file, $e_line, $e_vars )
{
    // Need these two vars:
    global $live, $contact_email;
    // Build the error message:
    $message = "An error occurred in script '$e_file' on line $e_line:\n$e_message\n";
    // Add the backtrace:
    $message .= "<pre>" . print_r(debug_backtrace(), 1) . "</pre>\n";
    // Or just append $e_vars to the message:
    //	$message .= "<pre>" . print_r ($e_vars, 1) . "</pre>\n";
    if ( !$live ) { // Show the error in the browser.
        echo '<div class="error">' . nl2br($message) . '</div>';
    } else { // Development (print the error).
        // Send the error in an email:
        error_log($message, 1, $contact_email, 'From:admin@example.com');
        // Only print an error message in the browser, if the error isn't a notice:
        if ( $e_number != E_NOTICE ) {
            echo '<div class="error">A system error occurred. We apologize for the inconvenience.</div>';
        }
    } // End of $live IF-ELSE.
    return TRUE; // So that PHP doesn't try to handle the error, too.
} // End of my_error_handler() definition.
set_error_handler('my_error_handler');
include_once CORE_CLASS."exceptionHandler.php";
set_exception_handler('exceptionHandler::instance');
/*
 * Make sure we track our users internally
 */
include_once INC_PHP."tracker.php";
$tracker=tracker::instance($dbcMinos);
$tracker->execute();
//Detect the device
$is_mobile=detectMobileDevice();
/*
 * Stripe
 */
require_once BASE_CONFIG."Geekdom.Stripe.config.php";
require_once BASE_CONFIG."Stripe.config.php";
require_once INC_PHP."edit_mode.inc.php";