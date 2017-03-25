<?php

use LibreNMS\RRD\RrdDefinition;

$name = 'nginx';
$app_id = $app['app_id'];
if (!empty($agent_data['app'][$name])) {
    $nginx = $agent_data['app'][$name];
} else {
    // Polls nginx statistics from script via SNMP
    $nginx = snmp_get($device, 'nsExtendOutputFull.5.110.103.105.110.120', '-Ovq', 'NET-SNMP-EXTEND-MIB');
}
update_application($app, $nginx);

echo ' nginx';

list($active, $reading, $writing, $waiting, $req) = explode("\n", $nginx);
d_echo("active: $active reading: $reading writing: $writing waiting: $waiting Requests: $req");

$rrd_name = array('app', $name, $app_id);
$rrd_def = RrdDefinition::make()
    ->addDataset('Requests', 'DERIVE', 0, 125000000000)
    ->addDataset('Active', 'GAUGE', 0, 125000000000)
    ->addDataset('Reading', 'GAUGE', 0, 125000000000)
    ->addDataset('Writing', 'GAUGE', 0, 125000000000)
    ->addDataset('Waiting', 'GAUGE', 0, 125000000000);

$fields = array(
    'Requests' => $req,
    'Active'   => $active,
    'Reading'  => $reading,
    'Writing'  => $writing,
    'Waiting'  => $waiting,
);

$tags = compact('name', 'app_id', 'rrd_name', 'rrd_def');
data_update($device, 'app', $tags, $fields);

// Unset the variables we set here
unset($nginx, $active, $reading, $writing, $req, $rrd_name, $rrd_def, $tags);
