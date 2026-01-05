<?php
session_start();
require 'admin/connexion.php';

$email = isset($_POST['email']) ? $_POST['email'] : null;
$password = isset($_POST['password']) ? $_POST['password'] : null;

if (!$email || !$password) {
    die('champs manquants');
}

$sql = "SELECT * FROM users WHERE email = ?";
$stmt = $connexion->prepare($sql);
$stmt->execute([$email]);
$user = $stmt->fetch();

if ($user && password_verify($password, $user['password'])) {
    $_SESSION['user_id'] = $user['id'];

    if ($user['role'] === 'admin') {
        header("Location: vue/dashboard.php");
    } else {
        header("Location: vue/dashboardClient.php");
    }
    exit;
} else {
    echo "Email ou mot de passe incorrect";
}
