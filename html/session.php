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
$page_title = "Coworks.In - Session";
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
require_once GEN_CLASS."session.php";
$session= new SessionModel($dbcUser);
include_once GENERATED_AGENCIES."viewsession.php";
$sessionAgency = viewSessionAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Session</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "session.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
