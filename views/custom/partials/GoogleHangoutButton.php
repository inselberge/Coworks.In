<?php
/**
 * Created by JetBrains PhpStorm.
 * Project: Coworks.In
 * User: Carl "Tex" Morgan
 * Date: 7/14/13
 * Time: 3:25 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
require_once __DIR__ . "/../../../config/Google.config.inc.php";
/**
 * Class GoogleHangoutButton
 */
class GoogleHangoutButton
{
    public function __construct()
    {

    }

    static public function execute($size)
    {
        try {
            if ( checkInput::checkNewInput($size) ) {
                self::forkSize($size);
            } else {
                throw new exceptionHandler (__METHOD__ . "Google Button size must be specified.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    protected function checkAppID()
    {
        if ( GOOGLE_HANGOUT_APP_ID ) {
            return true;
        } else {
            return false;
        }
    }

    protected function forkSize( $size )
    {
        try {
            if ( $size=="small" ) {
              $this->printSmall();
            } elseif ( $size== "medium") {
              $this->printMedium();
            } elseif ($size == "large") {
              $this->printLarge();
            } elseif ($size == "huge") {
              $this->printHuge();
            } else {
                throw new exceptionHandler (__METHOD__ . "Unknown Google Button size.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    protected function printSmall()
    {
        echo '<a href="https://plus.google.com/hangouts/_?gid=' . GOOGLE_HANGOUT_APP_ID . '" style="text-decoration:none;">
                <img src="https://ssl.gstatic.com/s2/oz/images/stars/hangout/1/gplus-hangout-15x79-normal.png"
                alt="Start a Hangout"
                style="border:0;width:79px;height:15px;"/>
              </a>';
    }

    protected function printMedium()
    {
        echo '<a href="https://plus.google.com/hangouts/_?gid=' . GOOGLE_HANGOUT_APP_ID . '" style="text-decoration:none;">
                <img src="https://ssl.gstatic.com/s2/oz/images/stars/hangout/1/gplus-hangout-20x86-normal.png"
                alt="Start a Hangout"
                style="border:0;width:86px;height:20px;"/>
            </a>';
    }

    protected function printLarge()
    {
        echo '<a href="https://plus.google.com/hangouts/_?gid=' . GOOGLE_HANGOUT_APP_ID . '" style="text-decoration:none;">
                <img src="https://ssl.gstatic.com/s2/oz/images/stars/hangout/1/gplus-hangout-24x100-normal.png"
                alt="Start a Hangout"
                style="border:0;width:100px;height:24px;"/>
            </a>';
    }

    protected function printHuge()
    {
        echo '<a href="https://plus.google.com/hangouts/_?gid=' . GOOGLE_HANGOUT_APP_ID . '" style="text-decoration:none;">
                <img src="https://ssl.gstatic.com/s2/oz/images/stars/hangout/1/gplus-hangout-60x230-normal.png"
                alt="Start a Hangout"
                style="border:0;width:230px;height:60px;"/>
            </a>';
    }
}
/*
GoogleHangoutButton::execute("small");
*/