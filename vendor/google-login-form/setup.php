<?php

// Includes

require_once 'includes/google-api-php-client/apiClient.php';
require_once 'includes/google-api-php-client/contrib/apiOauth2Service.php';
require_once 'includes/idiorm.php';
require_once 'includes/relativeTime.php';

// Session. Pass your own name if you wish.

session_name('tzine_demo');
session_start();

// Database configuration with the IDIORM library

$host = '';
$user = '';
$pass = '';
$database = '';

ORM::configure("mysql:host=$host;dbname=$database");
ORM::configure('username', $user);
ORM::configure('password', $pass);

// Changing the connection to unicode
ORM::configure('driver_options', array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

// Google API. Obtain these settings from https://code.google.com/apis/console/

$redirect_url = ''; // The url of your web site
$client_id = 'your-client-id';
$client_secret = 'your-client-secret';
$api_key = 'your-api-key';
