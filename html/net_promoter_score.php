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
$page_title = "Coworks.In - Net Promoter Score";
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
require_once GEN_CLASS."net_promoter_score.php";
$net_promoter_score= new Net_Promoter_Score();
echo '<div class="hero-unit shadow"><hgroup><h1>Net Promoter Score</h1><h3></h3></hgroup></div>';
require_once BROWSE_CONTROLLERS . "net_promoter_score.php";
include BROWSE_ELEMENTS."net_promoter_score.html";
//Check for edit mode and the id being set
if($edit_mode && $the_id){
	$net_promoter_score->get($dbc,$the_id);
}
//Build the net_promoter_score form
$net_promoter_score->makeForm();
// Include the HTML footer:
include BOOKENDS."footer.html";
?>
