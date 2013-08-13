<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 4/28/13
 * Time: 6:21 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
DEFINE ('STRIPE',VENDOR."Stripe.php");
DEFINE ('STRIPE_TEST_SECRET',"sk_test_EaSkuvP48CeVoD5orVw4eD2E");
DEFINE ('STRIPE_TEST_PUBLIC',"pk_test_QTIZnnLEYcq8OKxurQUzIIcB");

DEFINE ('STRIPE_LIVE_SECRET',"sk_live_ruMFDRmSYX5eEWMbE4fmZRsR");
DEFINE ('STRIPE_LIVE_PUBLIC',"pk_live_w4VgD6k6Hkmza50EwupQWtb4");

DEFINE ('STRIPE_TEST_CLIENT_ID',"ca_");
DEFINE ('STRIPE_LIVE_CLIENT_ID',"ca_");

/*
 *  true = use Production Keys, false = use Testing/Development Keys
 */
$liveStripe = false;
/*
 * Stripe API Version
 */
DEFINE ('STRIPE_API_VERSION',"2012-10-26");