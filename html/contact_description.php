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
$page_title = "Coworks.In - Contact Description";
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
require_once GEN_CLASS."contact_description.php";
$contact_description= new Contact_Description();
echo '<div class="hero-unit shadow"><hgroup><h1>Contact Description</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "contact_description.php";
include BROWSE_ELEMENTS."contact_description.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$contact_description->get($dbc,$the_id);
}
//Build the contact_description form
$contact_description->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
