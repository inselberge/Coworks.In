<?php 
define ('APP_NAME', 'Coworks.In');
define ('APP_WEBSITE', 'coworks.in');
define ('BASE_URI', '/home/carl/Public/Amphibian/generators/php/../../../coworks.in/');
define ('PUBLIC_BASE_URI', '/home/carl/Public/Amphibian/generators/php/../../../coworks.in/html/');
if(isset($live) AND $live==false) {
    define ('BASE_URL', 'localhost/Coworks.In');
} else {
    define ('BASE_URL', 'http://coworks.in/');
}
define ('BASE_CSS', BASE_URI.'css/');
define ('BASE_JAVASCRIPT', BASE_URI.'js/');
define ('BASE_CONFIG', BASE_URI.'config/');
define ('CONTROLLERS', BASE_URI . 'controllers/');
define ('CUSTOM_CONTROLLERS', CONTROLLERS . 'custom/');
define ('GEN_CONTROLLERS', CONTROLLERS . 'generated/');
define ('BROWSE_CONTROLLERS', GEN_CONTROLLERS . 'browse/');
define ('FORMS_CONTROLLERS', GEN_CONTROLLERS . 'forms/');
define ('PARTIALS_CONTROLLERS', GEN_CONTROLLERS . 'partials/');
define ('DATABASE',BASE_URI.'database/');
define ('DATABASE_BACKUP',DATABASE.'backup/');
define ('DATABASE_CUSTOM_STORED_PROCEDURES', DATABASE . 'custom_sprocs/');
define ('DATABASE_CUSTOM_VIEWS', DATABASE . 'custom_views/');
define ('DATABASE_DIAGRAMS',DATABASE.'diagrams/');
define ('DATABASE_STORED_PROCEDURES', DATABASE . 'generated_sprocs/');
define ('DATABASE_VIEWS', DATABASE . 'generated_views/');
define ('DATABASE_CONNECTIONS',DATABASE.'connections/');
define ('MYSQL_BROWSE', DATABASE_CONNECTIONS.'mysql_browse.inc.php');
define ('MYSQL', DATABASE_CONNECTIONS.'mysql_user.inc.php');
define ('MYSQL_ADMIN', DATABASE_CONNECTIONS.'mysql_Adm1n.inc.php');
define ('MYSQL_POWER_USER', DATABASE_CONNECTIONS.'mysql_pwrUser.inc.php');
define ('IMAGES', BASE_URI . 'image/');
define ('PUBLIC_IMAGES', PUBLIC_BASE_URI . 'image/');
define ('INCLUDES', BASE_URI . 'includes/');
define ('BOOKENDS', INCLUDES . 'bookends/');
define ('CORE_CLASS', INCLUDES . 'core_class/');
define ('INC_PHP', INCLUDES . 'inc/');
define ('LIB', BASE_URI . 'lib/');
define ('MODELS', BASE_URI . 'models/');
define ('GEN_CLASS', MODELS .'generated_class/');
define ('HELP_CLASS', MODELS . 'helper_class/');
define ('CUSTOM_CLASS', MODELS . 'custom_class/');
define ('VIEWS', BASE_URI . 'views/');
define ('BROWSE_ELEMENTS', VIEWS . 'browse/');
define ('FORM_ELEMENTS', VIEWS . 'forms/');
define ('PARTIAL_ELEMENTS', VIEWS . 'partials/');
define ('VENDOR', BASE_URI . 'vendor/');
