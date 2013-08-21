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
$page_title = "Coworks.In - Coworking Space Billing Plan";
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
require_once GEN_CLASS."coworking_space_billing_plan.php";
$coworking_space_billing_plan= new Coworking_Space_Billing_PlanModel($dbcUser);
include_once GENERATED_AGENCIES."viewcoworking_space_billing_plan.php";
$coworking_space_billing_planAgency = viewCoworking_Space_Billing_PlanAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Coworking Space Billing Plan</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "coworking_space_billing_plan.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
