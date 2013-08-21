<?php
/**
 * PHP Version 5.4.9-4ubuntu2.2
 * Created by JetBrains PhpStorm.
 * Project: Coworks.In
 * User: Carl "Tex" Morgan
 * Date: 8/14/13
 * Time: 9:21 AM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
require_once __DIR__."/../../../config/config.inc.php";

require_once CORE_CLASS."basicBrowse.php";
require_once GENERATED_AGENCIES."viewevent.php";
$brw = basicBrowse::instance($dbcBrowse);
$evAgency = viewEventAgency::instance($dbcUser);
$brw->setIdName("Upcoming Events");
$brw->setAgency($evAgency);
$brw->setRenderMethod("HTML");
$brw->execute();