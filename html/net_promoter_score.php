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
$page_title = "Coworks.In - Net Promoter Score";
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
require_once GEN_CLASS."net_promoter_score.php";
$net_promoter_score= new Net_Promoter_ScoreModel($dbcUser);
include_once GENERATED_AGENCIES."viewnet_promoter_score.php";
$net_promoter_scoreAgency = viewNet_Promoter_ScoreAgency::instance($dbcUser);
echo '<div class="hero-unit shadow"><hgroup><h1>Net Promoter Score</h1><h3></h3></hgroup></div>';
require_once GEN_CONTROLLERS . "net_promoter_score.php";
//Check for edit mode and the id being set
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
