<?php
/* vim: set expandtab sw=4 ts=4 sts=4: */
/**
 * phpMyAdmin sample configuration, you can use it as base for
 * manual configuration. For easier setup you can use setup/
 *
 * All directives are explained in documentation in the doc/ folder
 * or at <http://docs.phpmyadmin.net/>.
 *
 * @package PhpMyAdmin
 */

/*
 * This is needed for cookie based authentication to encrypt password in
 * cookie
 */
$cfg['blowfish_secret'] = "umscloud_pma"; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

/*
 * Servers configuration
 */
$i = 0;

/*
 * First server
 */
$i++;
/* Authentication type */
$cfg['Servers'][$i]['verbose']   = 'test_mysql_master';
/* Server parameters */
$cfg['Servers'][$i]['host'] = "192.168.1.3";
$cfg['Servers'][$i]['port'] = "3306";

$i++;
/* Authentication type */
$cfg['Servers'][$i]['verbose']   = 'test_mysql_slave';
/* Server parameters */
$cfg['Servers'][$i]['host'] = "192.168.1.3";
$cfg['Servers'][$i]['port'] = "3307";

$i++;
/* Authentication type */
$cfg['Servers'][$i]['verbose']   = 'sandbox_mysql_master';
/* Server parameters */
$cfg['Servers'][$i]['host'] = "192.168.1.4";
$cfg['Servers'][$i]['port'] = "3306";

$i++;
/* Authentication type */
$cfg['Servers'][$i]['verbose']   = 'sandbox_mysql_slave';
/* Server parameters */
$cfg['Servers'][$i]['host'] = "192.168.1.4";
$cfg['Servers'][$i]['port'] = "3307";


for($k=1; $k<=$i; $k++){
	$cfg['Servers'][$k]['auth_type'] = 'cookie';
	$cfg['Servers'][$k]['connect_type'] = 'tcp';
	$cfg['Servers'][$k]['compress'] = true;
	/* Select mysql if your server does not have mysqli */
	$cfg['Servers'][$k]['extension'] = 'mysqli';
	$cfg['Servers'][$k]['AllowNoPassword'] = false;
	/*
	 * phpMyAdmin configuration storage settings.
 	*/

	/* User used to manipulate with storage */
	$cfg['Servers'][$k]['controlhost'] = "$PMA_HOST";
	$cfg['Servers'][$k]['controlport'] = "$PMA_PORT";
	$cfg['Servers'][$k]['controluser'] = "$PMA_USERNAME";
	$cfg['Servers'][$k]['controlpass'] = "$PMA_PASSWORD";

	/* Storage database and tables */
	$cfg['Servers'][$k]['pmadb'] = 'phpmyadmin';
	$cfg['Servers'][$k]['bookmarktable'] = 'pma__bookmark';
	$cfg['Servers'][$k]['relation'] = 'pma__relation';
	$cfg['Servers'][$k]['table_info'] = 'pma__table_info';
	$cfg['Servers'][$k]['table_coords'] = 'pma__table_coords';
	$cfg['Servers'][$k]['pdf_pages'] = 'pma__pdf_pages';
	$cfg['Servers'][$k]['column_info'] = 'pma__column_info';
	$cfg['Servers'][$k]['history'] = 'pma__history';
	$cfg['Servers'][$k]['table_uiprefs'] = 'pma__table_uiprefs';
	$cfg['Servers'][$k]['tracking'] = 'pma__tracking';
	$cfg['Servers'][$k]['designer_coords'] = 'pma__designer_coords';
	$cfg['Servers'][$k]['userconfig'] = 'pma__userconfig';
	$cfg['Servers'][$k]['recent'] = 'pma__recent';
	$cfg['Servers'][$k]['favorite'] = 'pma__favorite';
	$cfg['Servers'][$k]['central_columns'] = 'pma__central_columns';
	$cfg['Servers'][$k]['users'] = 'pma__users';
	$cfg['Servers'][$k]['savedsearches'] = 'pma__savedsearches';
	$cfg['Servers'][$k]['usergroups'] = 'pma__usergroups';
	$cfg['Servers'][$k]['navigationhiding'] = 'pma__navigationhiding';
	/* Contrib / Swekey authentication */
	// $cfg['Servers'][$i]['auth_swekey_config'] = '/etc/swekey-pma.conf';
}

/*
 * End of servers configuration
 */

/*
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

/**
 * Defines whether a user should be displayed a "show all (records)"
 * button in browse mode or not.
 * default = false
 */
//$cfg['ShowAll'] = true;

/**
 * Number of rows displayed when browsing a result set. If the result
 * set contains more rows, "Previous" and "Next".
 * default = 30
 */
//$cfg['MaxRows'] = 50;

/**
 * disallow editing of binary fields
 * valid values are:
 *   false    allow editing
 *   'blob'   allow editing except for BLOB fields
 *   'noblob' disallow editing except for BLOB fields
 *   'all'    disallow editing
 * default = blob
 */
//$cfg['ProtectBinary'] = 'false';

/**
 * Default language to use, if not browser-defined or user-defined
 * (you find all languages in the locale folder)
 * uncomment the desired line:
 * default = 'en'
 */
//$cfg['DefaultLang'] = 'en';
//$cfg['DefaultLang'] = 'de';

/**
 * default display direction (horizontal|vertical|horizontalflipped)
 */
//$cfg['DefaultDisplay'] = 'vertical';


/**
 * How many columns should be used for table display of a database?
 * (a value larger than 1 results in some information being hidden)
 * default = 1
 */
//$cfg['PropertiesNumColumns'] = 2;

/**
 * Set to true if you want DB-based query history.If false, this utilizes
 * JS-routines to display query history (lost by window close)
 *
 * This requires configuration storage enabled, see above.
 * default = false
 */
//$cfg['QueryHistoryDB'] = true;

/**
 * When using DB-based query history, how many entries should be kept?
 *
 * default = 25
 */
//$cfg['QueryHistoryMax'] = 100;

/**
 * Should error reporting be enabled for JavaScript errors
 *
 * default = 'ask'
 */
//$cfg['SendErrorReports'] = 'ask';

/*
 * You can find more configuration options in the documentation
 * in the doc/ folder or at <http://docs.phpmyadmin.net/>.
 */
?>
