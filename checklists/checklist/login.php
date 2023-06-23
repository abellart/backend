<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title>Checklist</title>
</head>
<body>
  <header>
    <a href="index.php">ГЛАВНАЯ</a>
  </header>
  <main>
  <?php

  $login = $_POST['login'];
  $password = $_POST['password'];
  
  if ($login=='') {
    
    echo "
    <h1>ВХОД</h1>
    <form method='POST' action='login.php' class='avtform'>
      <p>Логин</p>
      <input type='text' name='login' required>
      <p>Пароль</p>
      <input type='text' name='password' required><br>
      <input type='submit' value='Войти' class='avtbutton'>
      <a href='reg.php'>Зарегестрироваться</a>
    </form>";

  } else {

    include('conf.php');

    $sql="SELECT * FROM `users` WHERE `login`='$login' AND `password`='$password'";
    $table = mysqli_query($con, $sql);

    if (mysqli_num_rows($table) == 1) {

      $row=mysqli_fetch_array($table);
      setcookie("user_id", "$row[0]", time()+30*24*60*60);
      setcookie("login", "$row[1]", time()+30*24*60*60);
      header('Location: index.php');

    } else {

      echo "
      <h1>ВХОД</h1>
      <form method='POST' action='login.php' class='avtform'>
        <p>Неверный логин/пароль</p>
        <p>Логин</p>
        <input type='text' name='login' required>
        <p>Пароль</p>
        <input type='text' name='password' required><br>
        <input type='submit' value='Войти' class='avtbutton'>
        <a href='reg.php'>Зарегестрироваться</a>
      </form>";
    };
  };
  ?>
  </main>
</body>
</html>