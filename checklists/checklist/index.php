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
    <h1>ЧЕКЛИСТЫ</h1>
    <div class="checklists">
    <?php

    $user_id = $_COOKIE['user_id'];
    $login = $_COOKIE['login'];

    if ($user_id=='') {
      header('Location: login.php');
    }

    echo "<p>$login - <a href='logout.php'>выйти</a></p>";

    include('conf.php');
    $sql="SELECT * FROM `checklists`";
    $table = mysqli_query($con, $sql);

    foreach ($table as $checklist) {

      $checklist_id = $checklist['checklist_id'];
      $title = $checklist['title'];
      $description = $checklist['description'];

      echo "
        <p class='checklist__name'><a href='checklist.php?checklist_id=$checklist_id'>$title</a> - $description</p>";
    };
    ?>
    </div>
  </main>
</body>
</html>