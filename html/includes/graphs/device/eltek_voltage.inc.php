<?php

$rrd_filename = rrd_name( $device['hostname'], 'eltek_voltage' );

require 'includes/graphs/common.inc.php';

$ds='voltage';

$colour_area = '9999cc';
$colour_line = '0000cc';

$colour_area_max = '9999cc';

$graph_max = 1;
$graph_min = 0;

$unit_text = 'Volts AC';

require 'includes/graphs/generic_simplex.inc.php';
