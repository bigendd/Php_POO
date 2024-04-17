<?php
const APP = 'app/';
const JS  = 'assets/js/';
const CSS = 'assets/css/';
const IMG = 'assets/img/';
const INC = 'includes/';

$page = isset($_GET['page']) ? $_GET['page'] : '';

require_once(INC . 'top.php');
?>
<body>
<?php
require_once(INC . 'menu.php');
?>
    <main id="conteneur">
<?php
/* Pour créer un autoload
    1 - Dans le terminal, tapez 'composer init' pour initialiser le projet
        Un dossier vendor et un fichier composer.json ont été crées

    2 - Créer un namespace dans vos fichiers de class. Ici namespace App sera créé dans Forum.php

    3 - Editez le fichier composer.json et renseignez ces valeurs :
        "autoload": {
            "psr-4": {
                "App\\": "app/"
            }
        },
    
    4 - sur le router, intégrez les lignes suivantes 
        require_once('vendor/autoload.php');
            va récupérer l'autoload
        
        use App\Forum;
            va récupérer la classe Forum du namespace App
        
        use App\Form;
            va récupérer la class Form du namespace App

    5 - supprimer le require_once qui allait directement chercher le fichier Forum.php

    6 - dans le terminal, lancez composer dump-autoload

    7 - testez votre


*/
require_once('autoload/autoload.php');
$forum = New Forum;
$reponse = New Form;
$log = New Log;


switch ($page) {
    default:
        $forum->AfficherThemes();
    break;

    case 'subject':
        $forum->AfficherSubject();
        $reponse->FormCreerSujet();
    break;

    case 'tralala':
        $forum->AfficherPost();
        $reponse->FormReponse();
    break;

    case 'addAnswer':
        $reponse->EnregistrerReponse();
        $forum->AfficherPost();
        $reponse->FormReponse();
    break;

    case 'addSubject':
        $reponse->EnregistrerSujet();
        $forum->AfficherSubject();
        $reponse->FormCreerSujet();
    break;

    case 'createForum':
        $reponse->FormCreerTheme();
    break;

    case 'addForum':
        $reponse->EnregistrerTheme();
        $forum->AfficherThemes();
        break;

    case 'logIn' :
        $log->FormLogin();
        $log->logIn();
        $forum->AfficherThemes();
        break;

    case 'logOut' :
        $log->LogOut();
        break;

    case 'inscrire' :
        $log->FormRegister();
        $log->Register();
        $log->Text();
        break;
}
?>
</main>
<?php
require_once(INC . 'bottom.php');
