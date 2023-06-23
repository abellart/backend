<?php

  function getSubItemStatus($sub_item_id) {

    $user_id = $_COOKIE['user_id'];

    include('conf.php');
    $sql="SELECT * FROM `users_sub_items` WHERE `sub_item_id`='$sub_item_id' AND `user_id`='$user_id'";
    $table = mysqli_query($con, $sql);

    if (mysqli_num_rows($table) == 0) {

      $sql="INSERT INTO `users_sub_items` VALUES (NULL,'$user_id','$sub_item_id','0')";
      $table = mysqli_query($con, $sql);

    } else {

      $row = mysqli_fetch_array($table);
      $status = $row['status'];
      return $status;
    };
  };

  function getSubItems($item_id) {

    include('conf.php');
    $sql="SELECT * FROM `checklists_sub_items` WHERE `item_id`='$item_id'";
    $table = mysqli_query($con, $sql);

    foreach($table as $sub_item) {

      $sub_item_id = $sub_item['sub_item_id'];
      $sub_item_title = $sub_item['title'];

      $status = getSubItemStatus($sub_item_id);

      if ($status == 0) {
        echo "<p><input type='checkbox' name='checklist_sub_item' class='checklist_sub_item' value='$sub_item_id'>$sub_item_title</p>";
      } else {
        echo "<p><input type='checkbox' name='checklist_sub_item' class='checklist_sub_item' value='$sub_item_id' checked>$sub_item_title</p>";
      };
    };
  };

  function getItemStatus($item_id) {

    $user_id = $_COOKIE['user_id'];

    include('conf.php');
    $sql="SELECT * FROM `users_items` WHERE `item_id`='$item_id' AND `user_id`='$user_id'";
    $table = mysqli_query($con, $sql);

    if (mysqli_num_rows($table) == 0) {

      $sql="INSERT INTO `users_items` VALUES (NULL,'$user_id','$item_id','0')";
      $table = mysqli_query($con, $sql);

    } else {

      $row = mysqli_fetch_array($table);
      $status = $row['status'];
      return $status;
    };
  };

  function getItems($checklist_id) {

    include('conf.php');
    $sql="SELECT * FROM `checklists_items` WHERE `checklist_id`='$checklist_id'";
    $table = mysqli_query($con, $sql);

    foreach($table as $checklist_item) {
      
      $item_id = $checklist_item['item_id'];
      $title = $checklist_item['title'];
      $description = $checklist_item['description'];

      $status = getItemStatus($item_id);

      echo "
      <div class='checklist'>
        <div class='check__header'>";
      if ($status == 0) {
        echo "
          <p><input type='checkbox' name='checklist_item' class='checklist_item' value='$item_id'>$title</p>";
      } else {
        echo "
          <p><input type='checkbox' name='checklist_item' class='checklist_item' value='$item_id' checked>$title</p>"; 
      };
      echo "
        <button class='show-btn'>+</button>
      </div>
      <div class='check__list'>
        <p class='check__about'>$description</p>";

      getSubItems($item_id);
        
      echo"
        </div>
      </div>";
    };
  };