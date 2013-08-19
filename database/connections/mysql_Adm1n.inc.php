<?php
DEFINE ('ADM1N_DB_USER', 'Coworks_Adm1n');
DEFINE ('ADM1N_DB_PASSWORD', '9gNtJPQ%tX#Bt#V');
DEFINE ('ADM1N_DB_HOST', 'localhost');
DEFINE ('ADM1N_DB_NAME', 'Coworks_In');
/*
 * SSL configuration constants
 * For help with SSL replication see this website:
 * http://www.webdevelopersdiary.com/1/post/2012/07/mysql-database-replication-using-ssl-on-ubuntu-1204.html
DEFINE ('ADM1N_SSL_KEY_PATH','/etc/mysql/server-key.pem');
DEFINE ('ADM1N_SSL_CERT_PATH','/etc/mysql/server-cert.pem');
DEFINE ('ADM1N_SSL_AUTH_PATH','/etc/mysql/ca-cert.pem');
DEFINE ('ADM1N_SSL_CA_PATH',NULL);
DEFINE ('ADM1N_SSL_CIPHER',NULL);
*/
/*
 * RSA configuration constants
DEFINE ('ADM1N_RSA_PUBLIC_KEY',NULL);
*/
// Make the connection:
$dbcAdm1n = mysqli_connect (ADM1N_DB_HOST, ADM1N_DB_USER, ADM1N_DB_PASSWORD, ADM1N_DB_NAME);
if( !$dbcAdm1n ) {
    die("Connection Error(".mysqli_connect_errno($dbcAdm1n).'): ' . mysqli_connect_error());
} else {
    // Set the character set:
    mysqli_set_charset($dbcAdm1n, 'utf8');
}