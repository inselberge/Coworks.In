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
$page_title = "Coworks.In - Response Vote";
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
require_once GEN_CLASS."response_vote.php";
$response_vote= new Response_Vote();
echo '<div class="hero-unit shadow"><hgroup><h1>Response Vote</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "response_vote.php";
include BROWSE_ELEMENTS."response_vote.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$response_vote->get($dbc,$the_id);
}
//Build the response_vote form
$response_vote->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
