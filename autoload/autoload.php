<?php
function monAutoload($class) {
    $path = 'app/';
    $file = $path . $class . '.php';
    if(file_exists($file)) {
        require_once $file;
    } else {
        echo "La classe $class n'a pas été trouvée.";
    }
}
spl_autoload_register('monAutoload');
