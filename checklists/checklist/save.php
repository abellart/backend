<?php

$user_id = $_COOKIE['user_id'];
$item_id = $_POST['item_id'];
$sub_item_id = $_POST['sub_item_id'];
$status = $_POST['stat'];

include('conf.php');

if ($sub_item_id=='') {
  $sql="UPDATE `users_items` SET `status`='$status' WHERE `item_id`='$item_id' AND `user_id`='$user_id'";
  $table = mysqli_query($con, $sql);
} else {
  $sql="UPDATE `users_sub_items` SET `status`='$status' WHERE `sub_item_id`='$sub_item_id' AND `user_id`='$user_id'";
  $table = mysqli_query($con, $sql);
};