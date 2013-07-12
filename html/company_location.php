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
$page_title = "Coworks.In - Company Location";
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
require_once GEN_CLASS."company_location.php";
$company_location= new Company_Location();
echo '<div class="hero-unit shadow"><hgroup><h1>Company Location</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "company_location.php";
include BROWSE_ELEMENTS."company_location.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$company_location->get($dbc,$the_id);
}
//Build the company_location form
$company_location->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
