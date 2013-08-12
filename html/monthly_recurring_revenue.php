<?php
require_once __DIR__."/../config/config.inc.php";
require_once MYSQL;
//tryUserLevelCheck(BRAND_ADMIN);
/*
* SEO specific to this page
*/
$author;
$description;
$keywords;
$keywords_not;
$page_title = "Coworks.In - Monthly Recurring Revenue";
/*
 * JavaScript and CSS specific to this page
 */
$js = array();
$css = array();
$prefetch = array();
$dns = array();
$prerender = array();
//Detect the device
$is_mobile=detectMobileDevice();
// Include the header file:
include BOOKENDS."header.html";
// Require the code to handle editing or creating a new object
require_once INC_PHP."edit_mode.inc.php";
// For storing errors:
$errors = array();
require_once GEN_CLASS."monthly_recurring_revenue.php";
$monthly_recurring_revenue= new Monthly_Recurring_Revenue($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Monthly Recurring Revenue</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "monthly_recurring_revenue.php";
include BROWSE_ELEMENTS."monthly_recurring_revenue.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$monthly_recurring_revenue->get($dbc,$the_id);
}
//Build the monthly_recurring_revenue form
$monthly_recurring_revenue->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
