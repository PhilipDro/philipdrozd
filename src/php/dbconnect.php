<?php

$con = mysqli_connect('localhost','phpmyadmin','Patta95+');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con, "phpmyadmin");

?>
