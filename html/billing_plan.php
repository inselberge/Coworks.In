<?php
require_once __DIR__."/../config/config.inc.php";
//tryUserLevelCheck(BRAND_ADMIN);
/*
* SEO specific to this page
*/
$author;
$description;
$keywords;
$keywords_not;
$page_title = "Coworks.In - Billing Plan";
/*
 * JavaScript and CSS specific to this page
 */
$js = array();
$css = array();
//Detect the device
$is_mobile=detectMobileDevice();
// Include the header file:
include BOOKENDS."header.html";
// Require the code to handle editing or creating a new object
require_once INC_PHP."edit_mode.inc.php";
// For storing errors:
$errors = array();
require_once GEN_CLASS."billing_plan.php";
$billing_plan= new Billing_Plan();
echo '<div class="hero-unit shadow"><hgroup><h1>Billing Plan</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "billing_plan.php";
include BROWSE_ELEMENTS."billing_plan.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$billing_plan->get($dbc,$the_id);
}
//Build the billing_plan form
$billing_plan->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
