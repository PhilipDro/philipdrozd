<?php
  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);
  include 'dbquery.php';

  while($row = mysqli_fetch_array($result)) {

    $id = $row['id'];
    $name = utf8_encode(nl2br($row['name']));
    $description = utf8_encode(nl2br($row['description']));
    $link = utf8_encode(nl2br($row['link']));
    $imgPath = $row['src'];
    if (!$imgPath && file_exists("../images/" . $input . '/' . $id . ".jpg")) {
      $imgPath = "images/" . $input . '/' . $id . ".jpg";
    }

    include 'outputElements.php';
  }
  mysqli_close($con);
?>
