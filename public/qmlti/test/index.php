<?php

$conn = new PDO('oci:dbname=//qmmoodle.caaoub65vm2a.eu-west-1.rds.amazonaws.com:1521/qmmoodle', 'qmmoodle', 'spO0sdlsma7sSw');

echo "in1<br>";
$sql = 'CREATE DATABASE Perception_LTI';
$conn->query($sql);

echo "in2<br>";
$sql = 'ALTER DATABASE Perception_LTI DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci';
$conn->query($sql);

echo "in3<br>";
$sql = "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON Perception_LTI.* TO qmmoodle@localhost IDENTIFIED BY 'spO0sdlsma7sSw';";
$conn->query($sql);

echo "in4<br>";