<!DOCTYPE html>
<html lang='ru'>
<head>
  <meta charset='UTF-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <link rel='stylesheet' href='style.css'>
  <title>Checklist</title>
</head>
<body>
  <header>
    <a href='index.php'>ГЛАВНАЯ</a>
  </header>
  <main>
  <?php
  
  $checklist_id = $_GET['checklist_id'];

  include('conf.php');
  $sql="SELECT * FROM `checklists` WHERE `checklist_id`='$checklist_id'";
  $table = mysqli_query($con, $sql);
  $row = mysqli_fetch_assoc($table);

  $checklist_title = $row['title'];

  echo"
  <h1>$checklist_title</h1>
  <input type='hidden' name='checklist_id' value=$checklist_id'>";

  include('get_check.php');
  getItems($checklist_id);

  ?>
  <a href="index.php">Назад</a>
  </main>

  <script src='js/jquery-3.7.0.min.js'></script>
  <script src='js/main.js'></script>

</body>
</html>