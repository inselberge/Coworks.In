<?php
require_once __DIR__."/../config/config.inc.php";
require_once __DIR__."/../config/Coworks.In.config.inc.php";
/*
* SEO specific to this page
*/
$author;
$description;
$keywords;
$keywords_not;
$page_title = "Coworks.In - User Type";
/*
 * JavaScript and CSS specific to this page
 */
$js = array();
$css = array();
$prefetch = array();
$dns = array();
$prerender = array();
// Include the header file:
include BOOKENDS."header.html";
// For storing errors:
$errors = array();
require_once GEN_CLASS."user_type.php";
$user_type= new User_TypeModel($dbcUser);
include_once GENERATED_AGENCIES."viewuser_type.php";
$user_typeAgency = viewUser_TypeAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>User Type</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "user_type.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
