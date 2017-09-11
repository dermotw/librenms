<?php

// Dermot Williams for Imagine 2017
//

$rrd_filename = rrd_name( $device['hostname'], 'aviat-rxperformance' );

require 'includes/graphs/common.inc.php';

$rrd_options .= " COMMENT:'RSL  	Current	Average	Maximum\\n'";

$rrd_options .= " DEF:RxA_aRxRslCurrent=$rrd_filename:RxA_aRxRslCurrent:AVERAGE";
$rrd_options .= " LINE:RxA_aRxRslCurrent#FF6969:'Radio A'";
$rrd_options .= ' GPRINT:RxA_aRxRslCurrent:LAST:%6.2lf%s';
$rrd_options .= ' GPRINT:RxA_aRxRslCurrent:AVERAGE:%6.2lf%s';
$rrd_options .= " GPRINT:RxA_aRxRslCurrent:MAX:%6.2lf%s\\n";

$rrd_options .= " DEF:RxB_aRxRslCurrent=$rrd_filename:RxB_aRxRslCurrent:AVERAGE";
$rrd_options .= " LINE:RxB_aRxRslCurrent#69FF69:'Radio B'";
$rrd_options .= ' GPRINT:RxB_aRxRslCurrent:LAST:%6.2lf%s';
$rrd_options .= ' GPRINT:RxB_aRxRslCurrent:AVERAGE:%6.2lf%s';
$rrd_options .= " GPRINT:RxB_aRxRslCurrent:MAX:%6.2lf%s\\n";
