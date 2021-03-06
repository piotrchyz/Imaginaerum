<?php 
### CONFIGURATION FILE AUTOMATICALLY GENERATED BY THE OXYGEN WEBHELP INSTALLER AT 2018-08-15 04:04:57 ###
### for lewactwo_prawactwo 1.0 

// The TimeZone used in WebHelp 
define('__TIMEZONE__','Europe/Warsaw');

// The language of WebHelp 
define('__LANGUAGE__','en');

// The URL where the webhelp is installed on with trailing /
define('__BASE_URL__','http://www.lewactwo-vs-prawactwo.org/');

// The relative URL where the webhelp is installed on with trailing /
define('__BASE_PATH__','/');

// Email address to be used as from in sent emails
define('__EMAIL__','webmaster@lewactwo-vs-prawactwo.org');

// Email address to be notified when error occur
define('__ADMIN_EMAIL__','lewactwo@lewactwo-vs-prawactwo.org');

// Send errors to system administartor?
define('__SEND_ERRORS__',true);

// If the system is moderated each post must be confirmed by moderator
define('__MODERATE__', true);

// User session life time in seconds, by default is 7 days
define('__SESSION_LIFETIME__',604800);

// Is unauthenticated user allowed to post comments
define('__GUEST_POST__', true);

// User friendly Product name
define('__PRODUCT_NAME__','lewactwo vs prawactwo');

// Show comments form other products with the same version from the same database
//define('__SHARE_WITH__',"'editor','diff'");

// Data base connection info
$dbConnectionInfo['dbName']='lewactwo_feedback';
$dbConnectionInfo['dbUser']='lewactwo_feedbac';
$dbConnectionInfo['dbPassword']='dupajasiu';
$dbConnectionInfo['dbHost']='localhost';

// LDAP Server settings
define('LDAP_AUTH', false);
define('LDAP_SERVER','hostname');
define('LDAP_PORT','389');
define('LDAP_SSL_VERIFY', true);
define('LDAP_START_TLS', false);
define('LDAP_BIND_TYPE','anonymous');
define('LDAP_USERNAME','null');
define('LDAP_PASSWORD','null');
define('LDAP_ACCOUNT_BASE','ou=people,dc=example,dc=com');
define('LDAP_USER_PATTERN','uid=%s');
define('LDAP_ACCOUNT_FULLNAME','cn');
define('LDAP_ACCOUNT_EMAIL','mail');
define('LDAP_BIND_SCOPE','LDAP_SCOPE_ONELEVEL');
?>