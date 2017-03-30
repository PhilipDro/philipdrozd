<?php

include 'dbconnect.php';

$input = $_POST['input'];

if($input == 'inspiration')  {
  $sql="SELECT * FROM `muse` ORDER  BY `id` DESC";
}
else {
  $sql="SELECT * FROM `work` ORDER  BY `id` DESC";
}

$result = mysqli_query($con, $sql);


?>
