<?php
DEFINE ('PWRUSER_DB_USER', 'Members_pwrUser');
DEFINE ('PWRUSER_DB_PASSWORD', 'ej4DM^MwD#krq9m');
DEFINE ('PWRUSER_DB_HOST', 'localhost');
DEFINE ('PWRUSER_DB_NAME', 'geekdom_members');
/*
 * SSL configuration constants
 * For help with SSL replication see this website:
 * http://www.webdevelopersdiary.com/1/post/2012/07/mysql-database-replication-using-ssl-on-ubuntu-1204.html
DEFINE ('PWRUSER_SSL_KEY_PATH','/etc/mysql/server-key.pem');
DEFINE ('PWRUSER_SSL_CERT_PATH','/etc/mysql/server-cert.pem');
DEFINE ('PWRUSER_SSL_AUTH_PATH','/etc/mysql/ca-cert.pem');
DEFINE ('PWRUSER_SSL_CA_PATH',NULL);
DEFINE ('PWRUSER_SSL_CIPHER',NULL);
*/
/*
 * RSA configuration constants
DEFINE ('PWRUSER_RSA_PUBLIC_KEY',NULL);
*/
// Make the connection:
$dbcPwrUser = mysqli_connect (PWRUSER_DB_HOST, PWRUSER_DB_USER, PWRUSER_DB_PASSWORD, PWRUSER_DB_NAME);
if( !$dbcPwrUser ) {
    die("Connection Error(".mysqli_connect_errno($dbcPwrUser).'): ' . mysqli_connect_error());
} else {
    // Set the character set:
    mysqli_set_charset($dbcPwrUser, 'utf8');
}