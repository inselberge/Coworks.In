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
$page_title = "Coworks.In - Company Tags";
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
require_once GEN_CLASS."company_tags.php";
$company_tags= new Company_Tags();
echo '<div class="hero-unit shadow"><hgroup><h1>Company Tags</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "company_tags.php";
include BROWSE_ELEMENTS."company_tags.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$company_tags->get($dbc,$the_id);
}
//Build the company_tags form
$company_tags->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
