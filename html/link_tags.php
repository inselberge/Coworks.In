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
$page_title = "Coworks.In - Link Tags";
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
require_once GEN_CLASS."link_tags.php";
$link_tags= new Link_Tags($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Link Tags</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "link_tags.php";
include BROWSE_ELEMENTS."link_tags.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$link_tags->get($dbc,$the_id);
}
//Build the link_tags form
$link_tags->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
