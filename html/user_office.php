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
$page_title = "Coworks.In - User Office";
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
require_once GEN_CLASS."user_office.php";
$user_office= new User_OfficeModel($dbcUser);
include_once GENERATED_AGENCIES."viewuser_office.php";
$user_officeAgency = viewUser_OfficeAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>User Office</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "user_office.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
