<?php

try{
  echo "In1";
  $conn = new PDO('oci:dbname=//perceptionlti.caaoub65vm2a.eu-west-1.rds.amazonaws.com:1521/ORCL', 'qmmoodle', 'spO0sdlsma7sSw');
  echo "In2";
}catch(PDOException $e){
  echo ($e->getMessage());
}

