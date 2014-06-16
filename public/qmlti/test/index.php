<?php

$conn = new PDO('oci:dbname=//qmmoodle.caaoub65vm2a.eu-west-1.rds.amazonaws.com:1521/qmmoodle', 'qmmoodle', 'spO0sdlsma7sSw');

$sql = 'CREATE DATABASE Perception_LTI';
$conn->query($sql)

$sql = 'ALTER DATABASE Perception_LTI DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci';
$conn->query($sql)

$sql = "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON Perception_LTI.* TO qmmoodle@localhost IDENTIFIED BY 'spO0sdlsma7sSw';";
$conn->query($sql)