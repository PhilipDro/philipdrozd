<?php

include 'dbconnect.php';

$sql="SELECT * FROM `muse` ORDER  BY `id` DESC";


$result = mysqli_query($con, $sql);


?>
