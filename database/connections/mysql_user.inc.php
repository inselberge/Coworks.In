<?php
DEFINE ('USER_DB_USER', 'Members_user');
DEFINE ('USER_DB_PASSWORD', 'eG%yhdimm4AzhAr');
DEFINE ('USER_DB_HOST', 'localhost');
DEFINE ('USER_DB_NAME', 'geekdom_members');
/*
 * SSL configuration constants
 * For help with SSL replication see this website:
 * http://www.webdevelopersdiary.com/1/post/2012/07/mysql-database-replication-using-ssl-on-ubuntu-1204.html
DEFINE ('USER_SSL_KEY_PATH','/etc/mysql/server-key.pem');
DEFINE ('USER_SSL_CERT_PATH','/etc/mysql/server-cert.pem');
DEFINE ('USER_SSL_AUTH_PATH','/etc/mysql/ca-cert.pem');
DEFINE ('USER_SSL_CA_PATH',NULL);
DEFINE ('USER_SSL_CIPHER',NULL);
*/
/*
 * RSA configuration constants
DEFINE ('USER_RSA_PUBLIC_KEY',NULL);
*/
// Make the connection:
$dbcUser = mysqli_connect (USER_DB_HOST, USER_DB_USER, USER_DB_PASSWORD, USER_DB_NAME);
if( !$dbcUser ) {
    die("Connection Error(".mysqli_connect_errno($dbcUser).'): ' . mysqli_connect_error());
} else {
    // Set the character set:
    mysqli_set_charset($dbcUser, 'utf8');
}