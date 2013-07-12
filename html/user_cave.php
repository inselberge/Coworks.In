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
$page_title = "Coworks.In - User Cave";
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
require_once GEN_CLASS."user_cave.php";
$user_cave= new User_Cave();
echo '<div class="hero-unit shadow"><hgroup><h1>User Cave</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "user_cave.php";
include BROWSE_ELEMENTS."user_cave.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$user_cave->get($dbc,$the_id);
}
//Build the user_cave form
$user_cave->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
