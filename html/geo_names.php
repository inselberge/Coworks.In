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
$page_title = "Coworks.In - Geo Names";
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
require_once GEN_CLASS."geo_names.php";
$geo_names= new Geo_NamesModel($dbcUser);
include_once GENERATED_AGENCIES."viewgeo_names.php";
$geo_namesAgency = viewGeo_NamesAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Geo Names</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "geo_names.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
