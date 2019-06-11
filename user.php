<?php
  session_start();
  if(!$_SESSION['username'])
  {
    header('location: login2.php');
  } else {
    echo "Welcome deudor!";
  }
?>