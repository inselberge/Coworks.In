<?php
require_once __DIR__."/../config/config.inc.php";
require_once __DIR__."/../config/Coworks.In.config.inc.php";
/*
* SEO specific to this page
*/
$author;
$description;
$keywords;
$keywords_not;
$page_title = "Coworks.In - User Billing";
/*
 * JavaScript and CSS specific to this page
 */
$js = array();
$css = array();
$prefetch = array();
$dns = array();
$prerender = array();
// Include the header file:
include BOOKENDS."header.html";
// For storing errors:
$errors = array();
require_once GEN_CLASS."user_billing.php";
$user_billing= new User_BillingModel($dbcUser);
include_once GENERATED_AGENCIES."viewuser_billing.php";
$user_billingAgency = viewUser_BillingAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>User Billing</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "user_billing.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
