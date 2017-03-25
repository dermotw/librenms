<?php

$voltage = snmp_get( $device, 'acVoltage1.0', '-OQv', 'ELTEK-DISTRIBUTED-MIB' );
if ( preg_match( "/([0-9]+) Volts AC/", $voltage, $match ) ) {
 $rrd_def = "DS:voltage:GAUGE:600:0:U";

 $fields = array (
	'voltage' => $match[1]
 );

 $tags = compact( 'rrd_def' );
 data_update( $device, 'eltek_voltage', $tags, $fields );
 $graphs['eltek_voltage'] = true;
}
?>
