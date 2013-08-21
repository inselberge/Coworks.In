<?php
/**
 * Created by JetBrains PhpStorm.
 * Project: Members.Geekdom
 * User: Carl "Tex" Morgan
 * Date: 6/26/13
 * Time: 7:44 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
//generate a SEO friendly url
function SEO_URL( $strText )
{
    $strText = preg_replace('/[^A-Za-z0-9-]/', ' ', $strText);
    $strText = preg_replace('/ +/', ' ', $strText);
    $strText = trim($strText);
    $strText = str_replace(' ', '-', $strText);
    $strText = preg_replace('/-+/', '-', $strText);
    $strText = strtolower($strText);
    return $strText;
}