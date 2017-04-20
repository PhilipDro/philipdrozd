<?php

include 'dbconnect.php';

$input = $_POST['input'];

if($input == 'inspiration')  {
  $sql="SELECT * FROM `muse` ORDER  BY `id` DESC";
}
else if($input == 'work') {
  $sql="SELECT * FROM `work` ORDER  BY `id` DESC";
}
else if($input == 'ui') {
  $sql="SELECT * FROM `muse` WHERE `category` = 'ui' ORDER  BY `id` DESC";
}
else if($input == 'gd') {
  $sql="SELECT * FROM `muse` WHERE `category` = 'gd' ORDER  BY `id` DESC";
}
else if($input == 'art') {
  $sql="SELECT * FROM `muse` WHERE `category` = 'art' ORDER  BY `id` DESC";
}
else if($input == 'foto') {
  $sql="SELECT * FROM `muse` WHERE `category` = 'foto' ORDER  BY `id` DESC";
}
else if($input == 'stuff') {
  $sql="SELECT * FROM `muse` WHERE `category` = 'stuff' ORDER  BY `id` DESC";
}

$result = mysqli_query($con, $sql);


?>
