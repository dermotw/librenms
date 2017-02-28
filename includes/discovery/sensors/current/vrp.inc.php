<?php
/**
 * vrp.inc.php
 *
 * LibreNMS current sensor discovery module for VRP
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @package    LibreNMS
 * @link       http://librenms.org
 * @copyright  2016 Neil Lathwood
 * @author     Neil Lathwood <neil@lathwood.co.uk>
 */

echo 'Huawei VRP ';
$data = $pre_cache['vrp_oids']['hwEntityOpticalBiasCurrent'];

foreach ($data as $index => $value) {
    if (is_numeric($value) && $value >= 0) {
        $oid = '.1.3.6.1.4.1.2011.5.25.31.1.1.3.1.7.' . $index;
        $descr = $pre_cache['vrp_oids']['entPhysicalName'][$index];
        discover_sensor(
            $valid['sensor'],
            'current',
            $device,
            $oid,
            $index,
            'vrp',
            $descr,
            1000,
            1,
            0,
            0,
            70,
            75,
            $value
        );
    }
}
