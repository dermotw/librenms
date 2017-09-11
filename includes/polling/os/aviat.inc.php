<?php

// Dermot Williams for Imagine 2017
//

use LibreNMS\RRD\RrdDefinition;

$data = snmpwalk_cache_oid( $device, 'aviatRxPerformTable', array(), 'AVIAT-RXPERFORMANCE-MIB' );

$radio_a = '306184192';
$radio_b = '308281344';

$rrd_def = new RrdDefinition();

$fields = array();
foreach ( $data[$radio_a] as $oid => $val ) {
 $oid_ds = 'RxA_' . str_replace('aviatRxPerform', 'aRx', $oid );
 $oid_ds = str_replace( 'Reading', '', $oid_ds );
 $rrd_def->addDataSet( $oid_ds, 'GAUGE', null, 100000000000 );
 $rrdupdate = $val;
 $fields[$oid_ds] = $rrdupdate;
}

foreach ( $data[$radio_b] as $oid => $val ) {
 print $val . "\n";
 $oid_ds = 'RxB_' . str_replace('aviatRxPerform', 'aRx', $oid );
 $oid_ds = str_replace( 'Reading', '', $oid_ds );
 $rrd_def->addDataSet( $oid_ds, 'GAUGE', null, 100000000000 );
 $rrdupdate = $val;
 $fields[$oid_ds] = $rrdupdate;
}

$tags = compact('rrd_def');
data_update( $device, 'aviat-rxperformance', $tags, $fields );
$graphs['aviat_rsl'] = true;
?>
