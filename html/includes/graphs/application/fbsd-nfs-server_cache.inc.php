<?php
$name = 'fbsd-nfs-server';
$app_id = $app['app_id'];
$scale_min     = 0;
$colours       = 'mixed';
$unit_text     = 'per second';
$unitlen       = 10;
$bigdescrlen   = 10;
$smalldescrlen = 10;
$dostack       = 0;
$printtotal    = 0;
$addarea       = 1;
$transparency  = 15;

$rrd_filename = rrd_name($device['hostname'], array('app', $name, $app_id));

if (rrdtool_check_rrd_exists($rrd_filename)) {
    $rrd_list = array(
        array(
            'filename' => $rrd_filename,
            'descr'    => 'inprog',
            'ds'       => 'inprog',
            'colour'   => '582a72'
        ),
        array(
            'filename' => $rrd_filename,
            'descr'    => 'idem',
            'ds'       => 'idem',
            'colour'   => 'ffd1aa'
        ),
        array(
            'filename' => $rrd_filename,
            'descr'    => 'nonidem',
            'ds'       => 'nonidem',
            'colour'   => 'aa6c39'
        ),
        array(
            'filename' => $rrd_filename,
            'descr'    => 'misses',
            'ds'       => 'misses',
            'colour'   => '28536c'
        )
    );
} else {
    echo "file missing: $rrd_filename";
}

require 'includes/graphs/generic_v3_multiline.inc.php';
