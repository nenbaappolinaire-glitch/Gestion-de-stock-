<?php
/**************************************************
 * TRAITEMENT CRÉATION DE COMPTE
 * Compatible PHP 5 / 7 / 8
 **************************************************/

// 1️⃣ Connexion à la base de données
require_once "admin/connexion.php"; // adapte le chemin si nécessaire

// 2️⃣ Vérification des champs obligatoires
if (!isset($_POST['email']) || !isset($_POST['password'])) {
    die("Veuillez remplir tous les champs !");
}

$email = trim($_POST['email']);
$password_brut = $_POST['password'];

//  Gestion de la clé admin
$CLE_ADMIN = "ADMIN2025";
$admin_key = isset($_POST['admin_key']) ? trim($_POST['admin_key']) : "";

// Déterminer le rôle en fonction de la clé admin
$role = ($admin_key === $CLE_ADMIN) ? 'admin' : 'client';

// Vérification si l’email existe déjà
$verif = $connexion->prepare("SELECT id FROM users WHERE email = ?");
$verif->execute(array($email));

if ($verif->rowCount() > 0) {
    die("Cet email est déjà utilisé !");
}

//  Hash du mot de passe
$password_hash = password_hash($password_brut, PASSWORD_DEFAULT);

//  Insertion du compte dans la base
$insert = $connexion->prepare(
    "INSERT INTO users (email, password, role) VALUES (?, ?, ?)"
);
$insert->execute(array($email, $password_hash, $role));

//  Redirection vers la page de connexion
header("Location: index.php");
exit;



