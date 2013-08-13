<?php 
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

define ('AGENCIES', BASE_URI . 'agencies/');
define ('CUSTOM_AGENCIES', AGENCIES . 'custom/');
define ('GENERATED_AGENCIES', AGENCIES . 'generated/');
define ('TEST_AGENCIES', AGENCIES . 'tests/');
define ('TEST_CUSTOM_AGENCIES', TEST_AGENCIES . 'custom/');
define ('TEST_GENERATED_AGENCIES', TEST_AGENCIES . 'generated/');

define ('CONTROLLERS', BASE_URI . 'controllers/');
define ('CUSTOM_CONTROLLERS', CONTROLLERS . 'custom/');
define ('CUSTOM_CONTROLLERS_INTERFACES', CUSTOM_CONTROLLERS . 'interfaces/');
define ('GEN_CONTROLLERS', CONTROLLERS . 'generated/');
define ('GEN_CONTROLLERS_INTERFACES', GEN_CONTROLLERS . 'interfaces/');

define ('TEST_CONTROLLERS', CONTROLLERS . 'tests/');
define ('TEST_CUSTOM_CONTROLLERS', TEST_CONTROLLERS . 'custom/');
define ('TEST_CUSTOM_CONTROLLERS_INTERFACES', TEST_CUSTOM_CONTROLLERS . 'interfaces/');
define ('TEST_GENERATED_CONTROLLERS', TEST_CONTROLLERS . 'generated/');
define ('TEST_GENERATED_CONTROLLERS_INTERFACES', TEST_GENERATED_CONTROLLERS . 'interfaces/');

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
define ('ACCESS_LOG', SYSTEM_LOG . 'access/');
define ('EMAIL_LOG', SYSTEM_LOG . 'email/');
define ('ERROR_LOG', SYSTEM_LOG . 'error/');
define ('MALICIOUS_LOG', SYSTEM_LOG . 'malicious/');
define ('SLOW_LOG', SYSTEM_LOG . 'slow/');
define ('VIRUS_LOG', SYSTEM_LOG . 'virus/');
define ('WARNING_LOG', SYSTEM_LOG . 'warning/');
define ('DATABASE_LOG', LOG . 'database/');
define ('DATABASE_BACKUP_LOG', DATABASE_LOG . 'backup/');
define ('DATABASE_ERROR_LOG', DATABASE_LOG . 'error/');
define ('DATABASE_QUERY_LOG', DATABASE_LOG . 'query/');
define ('DATABASE_WARNING_LOG', DATABASE_LOG . 'warning/');

define ('MODELS', BASE_URI . 'models/');
define ('GEN_CLASS', MODELS .'generated/');
define ('GEN_CLASS_INTERFACES', GEN_CLASS . 'interfaces/');
define ('HELP_CLASS', MODELS . 'helpers/');
define ('HELP_CLASS_INTERFACES', HELP_CLASS . 'interfaces/');
define ('CUSTOM_CLASS', MODELS . 'custom/');
define ('CUSTOM_CLASS_INTERFACES', CUSTOM_CLASS . 'interfaces/');

define ('VIEWS', BASE_URI . 'views/');
define ('CUSTOM_VIEWS', VIEWS . 'custom/');
define ('CUSTOM_BROWSE_ELEMENTS', CUSTOM_VIEWS . 'browse/');
define ('CUSTOM_FORM_ELEMENTS', CUSTOM_VIEWS . 'forms/');
define ('CUSTOM_PARTIAL_ELEMENTS', CUSTOM_VIEWS . 'partials/');
define ('GENERATED_VIEWS', VIEWS . 'generated/');
define ('GENERATED_BROWSE_ELEMENTS', GENERATED_VIEWS . 'browse/');
define ('GENERATED_FORM_ELEMENTS', GENERATED_VIEWS . 'forms/');
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
