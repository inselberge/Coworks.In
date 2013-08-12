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
$page_title = "Coworks.In - Tags";
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
require_once GEN_CLASS."tags.php";
$tags= new Tags($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Tags</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "tags.php";
include BROWSE_ELEMENTS."tags.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$tags->get($dbc,$the_id);
}
//Build the tags form
$tags->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
