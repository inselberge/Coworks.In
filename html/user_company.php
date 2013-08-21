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
$page_title = "Coworks.In - User Company";
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
require_once GEN_CLASS."user_company.php";
$user_company= new User_CompanyModel($dbcUser);
include_once GENERATED_AGENCIES."viewuser_company.php";
$user_companyAgency = viewUser_CompanyAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>User Company</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "user_company.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
