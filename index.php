<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title> Connexion</title>
    <link rel="stylesheet" href="public/css/styles.css">
</head>
<body>

<div class="container">
    <div class="box">
        <h1>Welcome back</h1>
        <p class="subtitle">Veillez entrer vos informations</p>

        <form action="index_traitement.php" method="POST">
            <input type="email" name="email" placeholder="Email address" required>
            <input type="password" name="password" placeholder="Password" required>

            <div class="options">
                <a href="#">Mot de passe oubliez ?</a>
            </div>

            <button type="submit">Valider</button>

            <div class="google">
                <img src="https://www.svgrepo.com/show/475656/google-color.svg">
                Sign in with Google
            </div>

            <p class="footer">
                Créer un compte ? <a href="compte.php">Oui</a>
            </p>
        </form>
    </div>
</div>

</body>
</html>
