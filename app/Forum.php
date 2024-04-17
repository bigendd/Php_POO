<?php
// namespace App;
// use PDO;
// use PDOException;
class Forum {
    protected $host = "localhost";
    protected $db = "forum";
    protected $var = "charset=utf8";
    protected $user = "root";
    protected $pass = "root";
    public $idTheme;
    public $idSubject;
    protected $cnx;

    public function __construct() {
        try {
            $this->cnx = new PDO("mysql:host=" . $this->host . ";dbname=$this->db;$this->var", $this->user, $this->pass);
        }
        catch (PDOException $e){
            die("Connexion impossible". $e->getMessage());
        }
    }
    public function afficherThemes () {
        $s = $this->cnx->query("SELECT * FROM forum_theme ORDER BY nom ASC")->fetchAll();
        foreach($s as $theme) {
            echo '<p>';
            echo '<a href="?page=subject&id=' . $theme['id'] . '">';
            echo $theme['nom'];
            echo '</a>';
            echo '</p>';
        }
    }
    public function afficherSubject () {
        $s = $this->cnx->prepare("SELECT * FROM forum_topic WHERE theme_id = ? ORDER BY id DESC");
        $s->execute([$_GET['id']]);
        $subjects  = $s->fetchAll();
        foreach ($subjects as $subject) {
            echo '<p>';
            echo '<a href="?page=tralala&subjectId=' . $subject['id'] . '">';
            echo $subject['title'];
            echo '</a>';
            echo '</p>';
        }
    }
    public function afficherPost () {
        $s = $this->cnx->prepare("SELECT * FROM forum_post WHERE topic_id = ? ORDER BY id DESC");
        $s->execute([$_GET['subjectId']]);
        $subjects  = $s->fetchAll();
        foreach ($subjects as $subject) {
            echo '<p>';
            echo $subject['msg'];
            echo '</p>';
        }
    }
   
}

class Form extends Forum {
    public $cnx;                    
    private $titre;
    private $id_sujet;
    private $message;
    private $theme_id;
    private $id_utilisateur;
    public $ip;
    private $now;
    private $theme;
    public function FormReponse() {
        echo '<form action="?page=addAnswer&subjectId='.$_GET['subjectId'].'" method="post">';
        echo '<textarea id="editor" name="msg"></textarea>';
        echo '<input type="hidden" name="userId" value="25">';
        echo '<button>Envoyer</button>';
        echo '</form>';
    }
    public function EnregistrerReponse () {
        $s = $this->cnx->prepare("INSERT INTO forum_post SET msg = ?, user_id=?, user_ip = ?, topic_id = ?, edited_by_id = ?");
        $s->execute([$_POST['msg'], $_POST['userId'], $_SERVER['REMOTE_ADDR'], $_GET['subjectId'], $_POST['userId']]);
        echo "Enregistré";
    }
    public function FormCreerSujet() {
        echo '<form action="?page=addSubject&id='.$_GET['id'].'" method="post">';
        echo '<input type="text" name="titreSujet">';
        echo '<textarea id="editor" name="msg"></textarea>';
        echo '<input type="hidden" name="userId" value="25">';
        echo '<button>Envoyer</button>';
        echo '</form>';
    }
    public function EnregistrerSujet () {
        $this->titre = $_POST['titreSujet'];
        $this->message = $_POST['msg'];
        $this->ip = $_SERVER['REMOTE_ADDR'];
        $this->now = date("Y-m-d H:i:s");
        $this->id_utilisateur = $_POST['userId'];
        $this->theme_id = $_GET['id'];
        $ins_topic = $this->cnx->prepare("INSERT INTO forum_topic (title, user_id, user_ip, theme_id, num_replies) VALUES (?, ?, ?, ?, 1)");
        $ins_topic->execute([$this->titre, $this->id_utilisateur, $this->ip, $this->theme_id]);
        $this->id_sujet = $this->cnx->lastInsertId();

        // Insérer le premier post
        $ins_post = $this->cnx->prepare("INSERT INTO forum_post (topic_id, msg, user_id, user_ip, created_at, updated_at, edited_by_id) VALUES (?, ?, ?, ?, ?, ?, 0)");
        $ins_post->execute([$this->id_sujet, $this->message, $this->id_utilisateur, $this->ip, $this->now, $this->now]);
    }
    public function FormCreerTheme() {
        echo '<fieldset id="gender-fluide">';
        echo '<legend>Créer un forum</legend>';
        
        echo '<form action="?page=addForum" method="post">';
        echo '<input type="text" name="titreForum">';
        echo '<input type="hidden" name="userId" value="25">';
        echo '<button>Envoyer</button>';
        echo '</form>';
        echo '</fieldset>';
    }
    public function EnregistrerTheme () {
        $this->theme = $_POST['titreForum'];
        $ins_topic = $this->cnx->prepare("INSERT INTO forum_theme (nom, theme_position, theme_img_url, forum_hide) VALUES (?, ?, ?, ?)");
        $ins_topic->execute([$this->theme, 0, 0, 0]);
    }
   
}
class Log extends Form {
    

    public function FormLogin() {
        echo '<form method="post">'; // Specify method as POST
        echo '<input type="text" name="email" placeholder="Adresse e-mail">';
        echo '<input type="password" name="mdp" placeholder="Mot de passe">';
        echo '<button type="submit">Se connecter</button>'; // Use button type submit
        echo '</form>';
    }

    public function Login() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') { // Check if form is submitted with POST
            $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL); // Use filter_input for security
            $password = $_POST['mdp'];

            $stmt = $this->cnx->prepare("SELECT * FROM user WHERE email = :email");
            $stmt->bindParam(':email', $email);
            $stmt->execute();
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user && password_verify($password, $user['password'])) {
                session_start();
                $_SESSION['id'] = $user['id'];
                $_SESSION['pseudo'] = $user['username'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['niveau'] = $user['level_id'];
                // Redirect or do something else after successful login
                header("Location: index.php"); // Changer index.php par le chemin de votre page d'accueil
                
            exit();
            } else {
                echo "Adresse e-mail invalide ou mot de passe incorrect";
            }
        } 
    }
    public function Logout() {
        session_start();
        session_destroy();
        header("Location: index.php");
    }

    public function Register() {
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $hashOptions = [
            'memory_cost' => 1<<17, // 128MB
            'time_cost'   => 4,
            'threads'     => 2,
        ];
        $pseudo = htmlspecialchars($_POST['pseudo']);
        $email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);
        $mdp = password_hash($_POST['mdp'], PASSWORD_ARGON2ID, $hashOptions);
        $birth = htmlspecialchars($_POST['birth']);
        $ip = $_SERVER['REMOTE_ADDR'];
        
        // Assurez-vous de remplacer 'table' par votre nom de table réel
        $ins = $this->cnx->prepare("INSERT INTO user SET username = :pseudo, email= :email, password= :mdp, birth_date= :birth, registration_ip = :ip");
        $ins->bindParam(':pseudo', $pseudo);
        $ins->bindParam(':email', $email);
        $ins->bindParam(':mdp', $mdp);
        $ins->bindParam(':birth', $birth);
        $ins->bindParam(':ip', $ip);
        
        if ($ins->execute()) {
            $response = [
                'success' => true,
                'msg' => 'Utilisateur créé avec succès'
            ];
        } else {
            $response = [
                'success' => false,
                'msg' => 'Erreur lors du traitement'
            ];
        }
    }
}

    
    public function FormRegister() {
        echo '<form id="user-create" method="post">';
        echo '<h2>Créer un compte</h2>';
        echo '<label for="pseudo">Pseudo</label><input type="text" name="pseudo" id="pseudo">';
        echo '<label for="email">Email</label><input type="text" name="email" id="email">';
        echo '<label for="mdp">Mot de passe</label><input type="password" name="mdp" id="mdp">';
        echo '<label for="birth">Date de naissance</label><input type="date" name="birth" id="birth">';
        echo '<button type="submit">Créer l\'utilisateur</button>';
        echo '</form>';
    }
    public function Text() {
        echo "<h1>binevenue </h1>";
    }
}
    
 

