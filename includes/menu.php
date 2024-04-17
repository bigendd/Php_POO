<nav id="menu">
    <a href="index.php">Accueil</a>
    <a href="index.php?page=createForum">Créer un thème</a>
    
    <a href="index.php?page=logOut">Ce deconnecter </a>
    
    <?php 
        // si on est loggué, on dit bonjour
        if (isset($_SESSION['pseudo'])) {
            echo '<a href="?action=mp">Messagerie</a>';
            if (isset($_SESSION['niveau'])&&$_SESSION['niveau']==4) {
                echo '<a href="?action=admin">Administration</a>';
            }
            echo '<span>Bonjour <a href="?action=users&type=profil">' . $_SESSION['pseudo'] . '<a href="index.php?page=logOut">Ce deconnecter </a></span>';
            } else {
            echo '<a href="index.php?page=logIn">Ce connecter </a>';
            echo '<a href="index.php?page=inscrire">S inscrire </a>';
        }
    ?>

    
</nav>