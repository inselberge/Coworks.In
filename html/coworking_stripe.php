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
$page_title = "Coworks.In - Coworking Stripe";
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
require_once GEN_CLASS."coworking_stripe.php";
$coworking_stripe= new Coworking_Stripe($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Coworking Stripe</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "coworking_stripe.php";
include BROWSE_ELEMENTS."coworking_stripe.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$coworking_stripe->get($dbc,$the_id);
}
//Build the coworking_stripe form
$coworking_stripe->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
