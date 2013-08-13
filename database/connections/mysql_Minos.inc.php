<?php
/**
 * Created by JetBrains PhpStorm.
 * Project: Members.Geekdom
 * User: Carl "Tex" Morgan
 * Date: 7/17/13
 * Time: 6:16 PM
 * All rights reserved by Inselberge Inc. unless otherwise stated.
 */
DEFINE ('DB_PASSWORD', 'Br34dcr|_|mb$');
DEFINE ('DB_HOST', 'localhost');
DEFINE ('DB_USER', 'Minos_user');
DEFINE ('DB_NAME', 'geekdom_members');
/*
 * SSL configuration constants
 * For SSL replication see this website:
 * http://www.webdevelopersdiary.com/1/post/2012/07/mysql-database-replication-using-ssl-on-ubuntu-1204.html

DEFINE ('SSL_KEY_PATH','/etc/mysql/server-key.pem');
DEFINE ('SSL_CERT_PATH','/etc/mysql/server-cert.pem');
DEFINE ('SSL_AUTH_PATH','/etc/mysql/ca-cert.pem');
DEFINE ('SSL_CA_PATH',NULL);
DEFINE ('SSL_CIPHER',NULL);
*/
/*
 * RSA configuration constants

DEFINE ('RSA_PUBLIC_KEY',NULL);
*/
// Make the connection:
$dbcMinos = mysqli_connect (DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
if(!$dbcMinos){
    die('Connection Error('.mysqli_connect_errno($dbcMinos).'): ' . mysqli_connect_error());
}
else{
    // Set the character set:
    mysqli_set_charset($dbcMinos, 'utf8');
}