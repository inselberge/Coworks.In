<?php
DEFINE ('BROWSE_DB_USER', 'Coworks_browse');
DEFINE ('BROWSE_DB_PASSWORD', '%BXeX1oy5jq20y6');
DEFINE ('BROWSE_DB_HOST', 'localhost');
DEFINE ('BROWSE_DB_NAME', 'Coworks_In');
/*
 * SSL configuration constants
 * For help with SSL replication see this website:
 * http://www.webdevelopersdiary.com/1/post/2012/07/mysql-database-replication-using-ssl-on-ubuntu-1204.html
DEFINE ('BROWSE_SSL_KEY_PATH','/etc/mysql/server-key.pem');
DEFINE ('BROWSE_SSL_CERT_PATH','/etc/mysql/server-cert.pem');
DEFINE ('BROWSE_SSL_AUTH_PATH','/etc/mysql/ca-cert.pem');
DEFINE ('BROWSE_SSL_CA_PATH',NULL);
DEFINE ('BROWSE_SSL_CIPHER',NULL);
*/
/*
 * RSA configuration constants
DEFINE ('BROWSE_RSA_PUBLIC_KEY',NULL);
*/
// Make the connection:
$dbcBrowse = mysqli_connect (BROWSE_DB_HOST, BROWSE_DB_USER, BROWSE_DB_PASSWORD, BROWSE_DB_NAME);
if( !$dbcBrowse ) {
    die("Connection Error(".mysqli_connect_errno($dbcBrowse).'): ' . mysqli_connect_error());
} else {
    // Set the character set:
    mysqli_set_charset($dbcBrowse, 'utf8');
}