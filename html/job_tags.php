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
$page_title = "Coworks.In - Job Tags";
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
require_once GEN_CLASS."job_tags.php";
$job_tags= new Job_TagsModel($dbcUser);
include_once GENERATED_AGENCIES."viewjob_tags.php";
$job_tagsAgency = viewJob_TagsAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Job Tags</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "job_tags.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
