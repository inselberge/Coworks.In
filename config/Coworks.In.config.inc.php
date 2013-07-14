<?php 
$live = false;
$contactEmail = "errors@coworks.in";

define ('JQUERY_VERSION','1.10.1');
define ('JQUERY_UI_VERSION','1.10.3');
define ('JQUERY_MOBILE_VERSION','1.3.1');

define ('APP_NAME', 'Coworks.In');
define ('APP_WEBSITE', 'coworks.in');
define ('BASE_URI', '/var/www/Coworks.In/');
define ('PUBLIC_BASE_URI', '/var/www/Coworks.In/html/');
if(isset($live) AND $live==false) {
    define ('BASE_URL', 'localhost/Coworks.In');
} else {
    define ('BASE_URL', 'http://coworks.in/');
}

define ('BASE_CSS', PUBLIC_BASE_URI.'css/');
define ('BASE_JAVASCRIPT', PUBLIC_BASE_URI.'js/');
define ('IMAGES', BASE_URI . 'image/');
define ('PUBLIC_IMAGES', PUBLIC_BASE_URI . 'image/');

define ('BASE_CONFIG', BASE_URI.'config/');

define ('AGENCY', BASE_URI . 'agency/');
define ('CUSTOM_AGENCY', AGENCY . 'custom/');
define ('GENERATED_AGENCY', AGENCY . 'generated/');
define ('TEST_AGENCY', AGENCY . 'tests/');
define ('TEST_CUSTOM_AGENCY', TEST_AGENCY . 'custom/');
define ('TEST_GENERATED_AGENCY', TEST_AGENCY . 'generated/');

define ('CONTROLLERS', BASE_URI . 'controllers/');
define ('CUSTOM_CONTROLLERS', CONTROLLERS . 'custom/');
define ('CUSTOM_BROWSE_CONTROLLERS', CUSTOM_CONTROLLERS . 'browse/');
define ('CUSTOM_FORMS_CONTROLLERS', CUSTOM_CONTROLLERS . 'forms/');
define ('CUSTOM_CONTROLLERS_INTERFACES', CUSTOM_CONTROLLERS . 'interfaces/');
define ('CUSTOM_PARTIALS_CONTROLLERS', CUSTOM_CONTROLLERS . 'partials/');
define ('GEN_CONTROLLERS', CONTROLLERS . 'generated/');
define ('GEN_CONTROLLERS_INTERFACES', GEN_CONTROLLERS . 'interfaces/');
define ('BROWSE_CONTROLLERS', GEN_CONTROLLERS . 'browse/');
define ('FORMS_CONTROLLERS', GEN_CONTROLLERS . 'forms/');
define ('PARTIALS_CONTROLLERS', GEN_CONTROLLERS . 'partials/');

define ('TEST_CONTROLLERS', CONTROLLERS . 'tests/');
define ('TEST_CUSTOM_CONTROLLERS', TEST_CONTROLLERS . 'custom/');
define ('TEST_CUSTOM_BROWSE_CONTROLLERS', TEST_CUSTOM_CONTROLLERS . 'browse/');
define ('TEST_CUSTOM_FORM_CONTROLLERS', TEST_CUSTOM_CONTROLLERS . 'forms/');
define ('TEST_CUSTOM_PARTIAL_CONTROLLERS', TEST_CUSTOM_CONTROLLERS . 'partials/');
define ('TEST_GENERATED_CONTROLLERS', TEST_CONTROLLERS . 'generated/');
define ('TEST_GENERATED_BROWSE_CONTROLLERS', TEST_GENERATED_CONTROLLERS . 'browse/');
define ('TEST_GENERATED_FORM_CONTROLLERS', TEST_GENERATED_CONTROLLERS . 'forms/');
define ('TEST_GENERATED_PARTIAL_CONTROLLERS', TEST_GENERATED_CONTROLLERS . 'partials/');

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

define ('INCLUDES', BASE_URI . 'includes/');
define ('BOOKENDS', INCLUDES . 'bookends/');
define ('CORE_CLASS', '/home/carl/Public/Amphibian/generators/core/');
define ('CORE_INTERFACES', CORE_CLASS . 'interfaces/');
define ('INC_PHP', INCLUDES . 'inc/');

define ('LIB', BASE_URI . 'lib/');
define ('LOG', BASE_URI . 'log/');
define ('SYSTEM_LOG', LOG . 'system/');
define ('EMAIL_LOG', SYSTEM_LOG . 'email/');
define ('ERROR_LOG', SYSTEM_LOG . 'error/');
define ('MALICIOUS_LOG', SYSTEM_LOG . 'malicious/');
define ('VIRUS_LOG', SYSTEM_LOG . 'virus/');
define ('WARNING_LOG', SYSTEM_LOG . 'warning/');
define ('DATABASE_LOG', LOG . 'database/');
define ('DATABASE_BACKUP_LOG', DATABASE_LOG . 'backup/');
define ('DATABASE_ERROR_LOG', DATABASE_LOG . 'error/');
define ('DATABASE_QUERY_LOG', DATABASE_LOG . 'query/');
define ('DATABASE_WARNING_LOG', DATABASE_LOG . 'warning/');

define ('MODELS', BASE_URI . 'models/');
define ('GEN_CLASS', MODELS .'generated_class/');
define ('GEN_CLASS_INTERFACES', GEN_CLASS . 'interfaces/');
define ('HELP_CLASS', MODELS . 'helper_class/');
define ('HELP_CLASS_INTERFACES', HELP_CLASS . 'interfaces/');
define ('CUSTOM_CLASS', MODELS . 'custom_class/');
define ('CUSTOM_CLASS_INTERFACES', CUSTOM_CLASS . 'interfaces/');

define ('VIEWS', BASE_URI . 'views/');
define ('CUSTOM_VIEWS', VIEWS . 'custom/');
define ('CUSTOM_BROWSE_ELEMENTS', CUSTOM_VIEWS . 'browse/');
define ('CUSTOM_FORM_ELEMENTS', CUSTOM_VIEWS . 'forms/');
define ('CUSTOM_INTERFACES_ELEMENTS', CUSTOM_VIEWS . 'interfaces/');
define ('CUSTOM_PARTIAL_ELEMENTS', CUSTOM_VIEWS . 'partials/');
define ('GENERATED_VIEWS', VIEWS . 'generated/');
define ('GENERATED_BROWSE_ELEMENTS', GENERATED_VIEWS . 'browse/');
define ('GENERATED_FORM_ELEMENTS', GENERATED_VIEWS . 'forms/');
define ('GENERATED_INTERFACES_ELEMENTS', GENERATED_VIEWS . 'interfaces/');
define ('GENERATED_PARTIAL_ELEMENTS', GENERATED_VIEWS . 'partials/');

define ('TEST_VIEWS', VIEWS . 'tests/');
define ('CUSTOM_TEST_VIEWS', TEST_VIEWS . 'custom/');
define ('CUSTOM_TEST_BROWSE_ELEMENTS', CUSTOM_TEST_VIEWS . 'browse/');
define ('CUSTOM_TEST_FORM_ELEMENTS', CUSTOM_TEST_VIEWS . 'forms/');
define ('CUSTOM_TEST_PARTIAL_ELEMENTS', CUSTOM_TEST_VIEWS . 'partials/');
define ('GENERATED_TEST_VIEWS', TEST_VIEWS . 'generated/');
define ('GENERATED_TEST_BROWSE_ELEMENTS', GENERATED_TEST_VIEWS . 'browse/');
define ('GENERATED_TEST_FORM_ELEMENTS', GENERATED_TEST_VIEWS . 'forms/');
define ('GENERATED_TEST_PARTIAL_ELEMENTS', GENERATED_TEST_VIEWS . 'partials/');

define ('VENDOR', BASE_URI . 'vendor/');
