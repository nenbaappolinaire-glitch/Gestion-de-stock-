<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription</title>
    <link rel="stylesheet" href="public/css/styles.css">
</head>
<body>

<div class="container">
    <div class="box">
        <h1>Creation de Compte</h1>

        <form action="compte_traitement.php" method="POST">
            <input type="email" name="email" placeholder="Email address" required>
            <input type="password" name="password" placeholder="Password" required>

            <input type="password" name="admin_key" placeholder="Admin key (optional)">

            <button type="submit">Valider</button>

            <p class="footer">
                Vous avez deja un compte ? <a href="index.php">Oui</a>
            </p>
        </form>
    </div>
</div>

</body>
</html>
