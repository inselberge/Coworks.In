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
$page_title = "Coworks.In - Monthly Recurring Revenue";
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
require_once GEN_CLASS."monthly_recurring_revenue.php";
$monthly_recurring_revenue= new Monthly_Recurring_RevenueModel($dbcUser);
include_once GENERATED_AGENCIES."viewmonthly_recurring_revenue.php";
$monthly_recurring_revenueAgency = viewMonthly_Recurring_RevenueAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Monthly Recurring Revenue</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "monthly_recurring_revenue.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
