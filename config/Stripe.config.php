<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Carl "Tex" Morgan
 * Date: 5/1/13
 * Time: 12:29 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
require_once STRIPE;
if(isset($liveStripe) AND $liveStripe===true){
    Stripe::setApiKey(STRIPE_LIVE_SECRET);
} else {
    Stripe::setApiKey(STRIPE_TEST_SECRET);
}
Stripe::setApiVersion(STRIPE_API_VERSION);