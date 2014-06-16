<?php

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'oci';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'qmmoodle.caaoub65vm2a.eu-west-1.rds.amazonaws.com';
$CFG->dbname    = 'qmmoodle';
$CFG->dbuser    = 'qmmoodle';
$CFG->dbpass    = 'spO0sdlsma7sSw';
$CFG->prefix    = 'b_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => 1521
);

$CFG->wwwroot   = 'http://ec2-54-74-58-121.eu-west-1.compute.amazonaws.com';
$CFG->dataroot  = '/home/apps/qm_buildempire_co_uk/shared/public/data';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;

$CFG->passwordsaltmain = '&KaCnC<^-y0hd p{7@uM2W^sMM}p^;}4';

require_once(dirname(__FILE__) . '/lib/setup.php');