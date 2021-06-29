<?php
/**
 * Craft web bootstrap file
 */

// Define path constants
define('ENV_PATH', dirname(__DIR__));
define('CRAFT_BASE_PATH', ENV_PATH . '/craft');
define('CRAFT_VENDOR_PATH', ENV_PATH . '/vendor');
define('CRAFT_COMPOSER_PATH',  ENV_PATH . '/composer.json');

// Load Composer's autoloader
require_once CRAFT_VENDOR_PATH . '/autoload.php';

// Load dotenv?
if (class_exists('Dotenv\Dotenv') && file_exists(ENV_PATH . '/.env')) {
    Dotenv\Dotenv::create(ENV_PATH)->load();
}

// Define additional PHP constants
// (see https://craftcms.com/docs/3.x/config/#php-constants)
define('CRAFT_ENVIRONMENT', getenv('ENVIRONMENT') ?: 'production');
// ...

// Load and run Craft
/** @var craft\web\Application $app */
$app = require CRAFT_VENDOR_PATH . '/craftcms/cms/bootstrap/web.php';
$app->run();
