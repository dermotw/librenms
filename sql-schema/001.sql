CREATE TABLE IF NOT EXISTS `alerts` ( `id` int(11) NOT NULL AUTO_INCREMENT, `importance` int(11) NOT NULL DEFAULT '0', `device_id` int(11) NOT NULL, `message` text NOT NULL, `time_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `alerted` smallint(6) NOT NULL DEFAULT '0', KEY `id` (`id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `applications` ( `app_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `app_type` varchar(64) NOT NULL, PRIMARY KEY (`app_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `authlog` ( `id` int(11) NOT NULL AUTO_INCREMENT, `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `user` text NOT NULL, `address` text NOT NULL, `result` text NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `bgpPeers` ( `bgpPeer_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `astext` varchar(64) NOT NULL, `bgpPeerIdentifier` text NOT NULL, `bgpPeerRemoteAs` int(11) NOT NULL, `bgpPeerState` text NOT NULL, `bgpPeerAdminStatus` text NOT NULL, `bgpLocalAddr` text NOT NULL, `bgpPeerRemoteAddr` text NOT NULL, `bgpPeerInUpdates` int(11) NOT NULL, `bgpPeerOutUpdates` int(11) NOT NULL, `bgpPeerInTotalMessages` int(11) NOT NULL, `bgpPeerOutTotalMessages` int(11) NOT NULL, `bgpPeerFsmEstablishedTime` int(11) NOT NULL, `bgpPeerInUpdateElapsedTime` int(11) NOT NULL, PRIMARY KEY (`bgpPeer_id`), KEY `device_id` (`device_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `bgpPeers_cbgp` ( `device_id` int(11) NOT NULL, `bgpPeerIdentifier` varchar(64) NOT NULL, `afi` varchar(16) NOT NULL, `safi` varchar(16) NOT NULL, KEY `device_id` (`device_id`,`bgpPeerIdentifier`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `bills` ( `bill_id` int(11) NOT NULL AUTO_INCREMENT, `bill_name` text NOT NULL, `bill_type` text NOT NULL, `bill_cdr` int(11) DEFAULT NULL, `bill_day` int(11) NOT NULL DEFAULT '1', `bill_gb` int(11) DEFAULT NULL, `rate_95th_in` int(11) NOT NULL, `rate_95th_out` int(11) NOT NULL, `rate_95th` int(11) NOT NULL, `dir_95th` varchar(3) NOT NULL, `total_data` int(11) NOT NULL, `total_data_in` int(11) NOT NULL, `total_data_out` int(11) NOT NULL, `rate_average_in` int(11) NOT NULL, `rate_average_out` int(11) NOT NULL, `rate_average` int(11) NOT NULL, `bill_last_calc` datetime NOT NULL, `bill_custid` varchar(64) NOT NULL, `bill_ref` varchar(64) NOT NULL, `bill_notes` varchar(256) NOT NULL, `bill_autoadded` tinyint(1) NOT NULL, UNIQUE KEY `bill_id` (`bill_id`)) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;
CREATE TABLE IF NOT EXISTS `bill_data` ( `bill_id` int(11) NOT NULL, `timestamp` datetime NOT NULL, `period` int(11) NOT NULL, `delta` bigint(11) NOT NULL, `in_delta` bigint(11) NOT NULL, `out_delta` bigint(11) NOT NULL, KEY `bill_id` (`bill_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `bill_perms` ( `user_id` int(11) NOT NULL, `bill_id` int(11) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `bill_ports` ( `bill_id` int(11) NOT NULL, `port_id` int(11) NOT NULL, `bill_port_autoadded` tinyint(1) NOT NULL DEFAULT '0' ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `cef_switching` ( `cef_switching_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `entPhysicalIndex` int(11) NOT NULL, `afi` varchar(4) COLLATE utf8_unicode_ci NOT NULL, `cef_index` int(11) NOT NULL, `cef_path` varchar(16) COLLATE utf8_unicode_ci NOT NULL, `drop` int(11) NOT NULL, `punt` int(11) NOT NULL, `punt2host` int(11) NOT NULL, `drop_prev` int(11) NOT NULL, `punt_prev` int(11) NOT NULL, `punt2host_prev` int(11) NOT NULL, `updated` int(11) NOT NULL, `updated_prev` int(11) NOT NULL, PRIMARY KEY (`cef_switching_id`), UNIQUE KEY `device_id` (`device_id`,`entPhysicalIndex`,`afi`,`cef_index`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `customers` ( `customer_id` int(11) NOT NULL AUTO_INCREMENT, `username` char(64) NOT NULL, `password` char(32) NOT NULL, `string` char(64) NOT NULL, `level` tinyint(4) NOT NULL DEFAULT '0', PRIMARY KEY (`customer_id`), UNIQUE KEY `username` (`username`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `devices_attribs` ( `attrib_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `attrib_type` varchar(32) NOT NULL, `attrib_value` text NOT NULL, `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, PRIMARY KEY (`attrib_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `devices_perms` ( `user_id` int(11) NOT NULL, `device_id` int(11) NOT NULL, `access_level` int(4) NOT NULL DEFAULT '0', KEY `user_id` (`user_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `device_graphs` ( `device_id` int(11) NOT NULL, `graph` varchar(32) COLLATE utf8_unicode_ci NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `eventlog` ( `event_id` int(11) NOT NULL AUTO_INCREMENT, `host` int(11) NOT NULL DEFAULT '0', `datetime` datetime NOT NULL DEFAULT '1000-01-01 00:00:00', `message` text CHARACTER SET latin1, `type` varchar(64) CHARACTER SET latin1 DEFAULT NULL, `reference` varchar(64) CHARACTER SET latin1 NOT NULL, PRIMARY KEY (`event_id`), KEY `host` (`host`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `graph_types` ( `graph_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `graph_subtype` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `graph_section` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `graph_descr` varchar(64) COLLATE utf8_unicode_ci NOT NULL, `graph_order` int(11) NOT NULL, KEY `graph_type` (`graph_type`), KEY `graph_subtype` (`graph_subtype`), KEY `graph_section` (`graph_section`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `graph_types_dead` ( `graph_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `graph_subtype` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `graph_section` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `graph_descr` varchar(64) COLLATE utf8_unicode_ci NOT NULL, `graph_order` int(11) NOT NULL, KEY `graph_type` (`graph_type`), KEY `graph_subtype` (`graph_subtype`), KEY `graph_section` (`graph_section`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `hrDevice` ( `hrDevice_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `hrDeviceIndex` int(11) NOT NULL, `hrDeviceDescr` text CHARACTER SET latin1 NOT NULL, `hrDeviceType` text CHARACTER SET latin1 NOT NULL, `hrDeviceErrors` int(11) NOT NULL, `hrDeviceStatus` text CHARACTER SET latin1 NOT NULL, `hrProcessorLoad` tinyint(4) DEFAULT NULL, PRIMARY KEY (`hrDevice_id`), KEY `device_id` (`device_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipv4_addresses` ( `ipv4_address_id` int(11) NOT NULL AUTO_INCREMENT,`ipv4_address` varchar(32) CHARACTER SET latin1 NOT NULL, `ipv4_prefixlen` int(11) NOT NULL,`ipv4_network_id` varchar(32) CHARACTER SET latin1 NOT NULL, `interface_id` int(11) NOT NULL,PRIMARY KEY (`ipv4_address_id`), KEY `interface_id` (`interface_id`)) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipv4_mac` ( `interface_id` int(11) NOT NULL, `mac_address` varchar(32) CHARACTER SET latin1 NOT NULL, `ipv4_address` varchar(32) CHARACTER SET latin1 NOT NULL, KEY `interface_id` (`interface_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipv4_networks` ( `ipv4_network_id` int(11) NOT NULL AUTO_INCREMENT, `ipv4_network` varchar(64) CHARACTER SET latin1 NOT NULL, PRIMARY KEY (`ipv4_network_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipv6_addresses` ( `ipv6_address_id` int(11) NOT NULL AUTO_INCREMENT, `ipv6_address` varchar(128) CHARACTER SET latin1 NOT NULL, `ipv6_compressed` varchar(128) CHARACTER SET latin1 NOT NULL, `ipv6_prefixlen` int(11) NOT NULL, `ipv6_origin` varchar(16) CHARACTER SET latin1 NOT NULL, `ipv6_network_id` varchar(128) CHARACTER SET latin1 NOT NULL, `interface_id` int(11) NOT NULL, PRIMARY KEY (`ipv6_address_id`), KEY `interface_id` (`interface_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ipv6_networks` ( `ipv6_network_id` int(11) NOT NULL AUTO_INCREMENT, `ipv6_network` varchar(64) CHARACTER SET latin1 NOT NULL, PRIMARY KEY (`ipv6_network_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `juniAtmVp` ( `juniAtmVp_id` int(11) NOT NULL, `interface_id` int(11) NOT NULL, `vp_id` int(11) NOT NULL, `vp_descr` varchar(32) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `links` ( `id` int(11) NOT NULL AUTO_INCREMENT, `local_interface_id` int(11) DEFAULT NULL, `remote_interface_id` int(11) DEFAULT NULL, `active` tinyint(4) NOT NULL DEFAULT '1', `protocol` varchar(11) DEFAULT NULL, `remote_hostname` varchar(128) NOT NULL, `remote_port` varchar(128) NOT NULL, `remote_platform` varchar(128) NOT NULL, `remote_version` varchar(256) NOT NULL, PRIMARY KEY (`id`), KEY `src_if` (`local_interface_id`), KEY `dst_if` (`remote_interface_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `mempools` ( `mempool_id` int(11) NOT NULL AUTO_INCREMENT, `mempool_index` varchar(16) CHARACTER SET latin1 NOT NULL, `entPhysicalIndex` int(11) DEFAULT NULL, `hrDeviceIndex` int(11) DEFAULT NULL, `mempool_type` varchar(32) CHARACTER SET latin1 NOT NULL, `mempool_precision` int(11) NOT NULL DEFAULT '1', `mempool_descr` varchar(64) CHARACTER SET latin1 NOT NULL, `device_id` int(11) NOT NULL, `mempool_perc` int(11) NOT NULL, `mempool_used` bigint(16) NOT NULL, `mempool_free` bigint(16) NOT NULL, `mempool_total` bigint(16) NOT NULL, `mempool_largestfree` bigint(16) DEFAULT NULL, `mempool_lowestfree` bigint(16) DEFAULT NULL, PRIMARY KEY (`mempool_id`), KEY `device_id` (`device_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ospf_areas` ( `device_id` int(11) NOT NULL, `ospfAreaId` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfAuthType` varchar(64) COLLATE utf8_unicode_ci NOT NULL, `ospfImportAsExtern` varchar(128) COLLATE utf8_unicode_ci NOT NULL, `ospfSpfRuns` int(11) NOT NULL, `ospfAreaBdrRtrCount` int(11) NOT NULL, `ospfAsBdrRtrCount` int(11) NOT NULL, `ospfAreaLsaCount` int(11) NOT NULL, `ospfAreaLsaCksumSum` int(11) NOT NULL, `ospfAreaSummary` varchar(64) COLLATE utf8_unicode_ci NOT NULL, `ospfAreaStatus` varchar(64) COLLATE utf8_unicode_ci NOT NULL, UNIQUE KEY `device_area` (`device_id`,`ospfAreaId`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ospf_instances` ( `device_id` int(11) NOT NULL, `ospf_instance_id` int(11) NOT NULL, `ospfRouterId` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfAdminStat` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfVersionNumber` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfAreaBdrRtrStatus` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfASBdrRtrStatus` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfExternLsaCount` int(11) NOT NULL, `ospfExternLsaCksumSum` int(11) NOT NULL, `ospfTOSSupport` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfOriginateNewLsas` int(11) NOT NULL, `ospfRxNewLsas` int(11) NOT NULL, `ospfExtLsdbLimit` int(11) DEFAULT NULL, `ospfMulticastExtensions` int(11) DEFAULT NULL, `ospfExitOverflowInterval` int(11) DEFAULT NULL, `ospfDemandExtensions` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, UNIQUE KEY `device_id` (`device_id`,`ospf_instance_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ospf_nbrs` ( `device_id` int(11) NOT NULL, `interface_id` int(11) NOT NULL, `ospf_nbr_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfNbrIpAddr` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfNbrAddressLessIndex` int(11) NOT NULL, `ospfNbrRtrId` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfNbrOptions` int(11) NOT NULL, `ospfNbrPriority` int(11) NOT NULL, `ospfNbrState` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfNbrEvents` int(11) NOT NULL, `ospfNbrLsRetransQLen` int(11) NOT NULL, `ospfNbmaNbrStatus` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfNbmaNbrPermanence` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfNbrHelloSuppressed` varchar(32) COLLATE utf8_unicode_ci NOT NULL, UNIQUE KEY `device_id` (`device_id`,`ospf_nbr_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ospf_ports` ( `device_id` int(11) NOT NULL, `interface_id` int(11) NOT NULL, `ospf_port_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfIfIpAddress` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfAddressLessIf` int(11) NOT NULL, `ospfIfAreaId` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `ospfIfType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfAdminStat` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfRtrPriority` int(11) DEFAULT NULL, `ospfIfTransitDelay` int(11) DEFAULT NULL, `ospfIfRetransInterval` int(11) DEFAULT NULL, `ospfIfHelloInterval` int(11) DEFAULT NULL, `ospfIfRtrDeadInterval` int(11) DEFAULT NULL, `ospfIfPollInterval` int(11) DEFAULT NULL, `ospfIfState` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfDesignatedRouter` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfBackupDesignatedRouter` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfEvents` int(11) DEFAULT NULL, `ospfIfAuthKey` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfStatus` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfMulticastForwarding` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfDemand` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, `ospfIfAuthType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL, UNIQUE KEY `device_id` (`device_id`,`ospf_port_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `perf_times` ( `type` varchar(8) CHARACTER SET latin1 NOT NULL, `doing` varchar(64) CHARACTER SET latin1 NOT NULL, `start` int(11) NOT NULL, `duration` double(8,2) NOT NULL, `devices` int(11) NOT NULL, KEY `type` (`type`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `ports` ( `interface_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL DEFAULT '0', `port_descr_type` varchar(255) DEFAULT NULL, `port_descr_descr` varchar(255) DEFAULT NULL, `port_descr_circuit` varchar(255) DEFAULT NULL, `port_descr_speed` varchar(32) DEFAULT NULL, `port_descr_notes` varchar(255) DEFAULT NULL, `ifDescr` varchar(255) DEFAULT NULL, `ifName` varchar(64) DEFAULT NULL, `portName` varchar(128) DEFAULT NULL, `ifIndex` int(11) DEFAULT '0', `ifSpeed` bigint(20) DEFAULT NULL, `ifConnectorPresent` varchar(12) DEFAULT NULL, `ifPromiscuousMode` varchar(12) DEFAULT NULL, `ifHighSpeed` int(11) DEFAULT NULL, `ifOperStatus` varchar(16) DEFAULT NULL, `ifAdminStatus` varchar(16) DEFAULT NULL, `ifDuplex` varchar(12) DEFAULT NULL, `ifMtu` int(11) DEFAULT NULL, `ifType` text, `ifAlias` text, `ifPhysAddress` text, `ifHardType` varchar(64) DEFAULT NULL, `ifLastChange` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, `ifVlan` varchar(8) NOT NULL DEFAULT '', `ifTrunk` varchar(8) DEFAULT '', `ifVrf` int(11) NOT NULL, `counter_in` int(11) DEFAULT NULL, `counter_out` int(11) DEFAULT NULL, `ignore` tinyint(1) NOT NULL DEFAULT '0', `disabled` tinyint(1) NOT NULL DEFAULT '0', `detailed` tinyint(1) NOT NULL DEFAULT '0', `deleted` tinyint(1) NOT NULL DEFAULT '0', `pagpOperationMode` varchar(32) DEFAULT NULL, `pagpPortState` varchar(16) DEFAULT NULL, `pagpPartnerDeviceId` varchar(48) DEFAULT NULL, `pagpPartnerLearnMethod` varchar(16) DEFAULT NULL, `pagpPartnerIfIndex` int(11) DEFAULT NULL, `pagpPartnerGroupIfIndex` int(11) DEFAULT NULL, `pagpPartnerDeviceName` varchar(128) DEFAULT NULL, `pagpEthcOperationMode` varchar(16) DEFAULT NULL, `pagpDeviceId` varchar(48) DEFAULT NULL, `pagpGroupIfIndex` int(11) DEFAULT NULL, `ifInUcastPkts` bigint(20) DEFAULT NULL, `ifInUcastPkts_prev` bigint(20) DEFAULT NULL, `ifInUcastPkts_delta` bigint(20) DEFAULT NULL, `ifInUcastPkts_rate` int(11) DEFAULT NULL, `ifOutUcastPkts` bigint(20) DEFAULT NULL, `ifOutUcastPkts_prev` bigint(20) DEFAULT NULL, `ifOutUcastPkts_delta` bigint(20) DEFAULT NULL, `ifOutUcastPkts_rate` int(11) DEFAULT NULL, `ifInErrors` bigint(20) DEFAULT NULL, `ifInErrors_prev` bigint(20) DEFAULT NULL, `ifInErrors_delta` bigint(20) DEFAULT NULL, `ifInErrors_rate` int(11) DEFAULT NULL, `ifOutErrors` bigint(20) DEFAULT NULL, `ifOutErrors_prev` bigint(20) DEFAULT NULL, `ifOutErrors_delta` bigint(20) DEFAULT NULL, `ifOutErrors_rate` int(11) DEFAULT NULL, `ifInOctets` bigint(20) DEFAULT NULL, `ifInOctets_prev` bigint(20) DEFAULT NULL, `ifInOctets_delta` bigint(20) DEFAULT NULL, `ifInOctets_rate` int(11) DEFAULT NULL, `ifOutOctets` bigint(20) DEFAULT NULL, `ifOutOctets_prev` bigint(20) DEFAULT NULL, `ifOutOctets_delta` bigint(20) DEFAULT NULL, `ifOutOctets_rate` int(11) DEFAULT NULL, `poll_time` int(11) DEFAULT NULL, `poll_prev` int(11) DEFAULT NULL, `poll_period` int(11) DEFAULT NULL, PRIMARY KEY (`interface_id`), UNIQUE KEY `device_ifIndex` (`device_id`,`ifIndex`), KEY `if_2` (`ifDescr`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ports_adsl` ( `interface_id` int(11) NOT NULL, `port_adsl_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `adslLineCoding` varchar(8) COLLATE utf8_bin NOT NULL, `adslLineType` varchar(16) COLLATE utf8_bin NOT NULL, `adslAtucInvVendorID` varchar(8) COLLATE utf8_bin NOT NULL, `adslAtucInvVersionNumber` varchar(8) COLLATE utf8_bin NOT NULL, `adslAtucCurrSnrMgn` decimal(5,1) NOT NULL, `adslAtucCurrAtn` decimal(5,1) NOT NULL, `adslAtucCurrOutputPwr` decimal(5,1) NOT NULL, `adslAtucCurrAttainableRate` int(11) NOT NULL, `adslAtucChanCurrTxRate` int(11) NOT NULL, `adslAturInvSerialNumber` varchar(8) COLLATE utf8_bin NOT NULL, `adslAturInvVendorID` varchar(8) COLLATE utf8_bin NOT NULL, `adslAturInvVersionNumber` varchar(8) COLLATE utf8_bin NOT NULL, `adslAturChanCurrTxRate` int(11) NOT NULL, `adslAturCurrSnrMgn` decimal(5,1) NOT NULL, `adslAturCurrAtn` decimal(5,1) NOT NULL, `adslAturCurrOutputPwr` decimal(5,1) NOT NULL, `adslAturCurrAttainableRate` int(11) NOT NULL, UNIQUE KEY `interface_id` (`interface_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
CREATE TABLE IF NOT EXISTS `ports_perms` ( `user_id` int(11) NOT NULL, `interface_id` int(11) NOT NULL, `access_level` int(11) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ports_stack` ( `device_id` int(11) NOT NULL, `interface_id_high` int(11) NOT NULL, `interface_id_low` int(11) NOT NULL, `ifStackStatus` varchar(32) COLLATE utf8_unicode_ci NOT NULL, UNIQUE KEY `device_id` (`device_id`,`interface_id_high`,`interface_id_low`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `port_in_measurements` ( `port_id` int(11) NOT NULL, `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, `counter` bigint(11) NOT NULL, `delta` bigint(11) NOT NULL, KEY `port_id` (`port_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `port_out_measurements` ( `port_id` int(11) NOT NULL, `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, `counter` bigint(11) NOT NULL, `delta` bigint(11) NOT NULL, KEY `port_id` (`port_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `pseudowires` ( `pseudowire_id` int(11) NOT NULL AUTO_INCREMENT, `interface_id` int(11) NOT NULL, `peer_device_id` int(11) NOT NULL, `peer_ldp_id` int(11) NOT NULL, `cpwVcID` int(11) NOT NULL, `cpwOid` int(11) NOT NULL, PRIMARY KEY (`pseudowire_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `sensors` ( `sensor_id` int(11) NOT NULL AUTO_INCREMENT, `sensor_class` varchar(64) CHARACTER SET latin1 NOT NULL, `device_id` int(11) NOT NULL DEFAULT '0', `poller_type` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'snmp', `sensor_oid` varchar(64) CHARACTER SET latin1 NOT NULL, `sensor_index` varchar(10) COLLATE utf8_unicode_ci NOT NULL, `sensor_type` varchar(255) CHARACTER SET latin1 NOT NULL, `sensor_descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, `sensor_divisor` int(11) NOT NULL DEFAULT '1', `sensor_multiplier` int(11) NOT NULL DEFAULT '1', `sensor_current` float DEFAULT NULL, `sensor_limit` float DEFAULT NULL, `sensor_limit_warn` float DEFAULT NULL, `sensor_limit_low` float DEFAULT NULL, `sensor_limit_low_warn` float DEFAULT NULL, `entPhysicalIndex` varchar(16) CHARACTER SET latin1 DEFAULT NULL, `entPhysicalIndex_measured` varchar(16) CHARACTER SET latin1 DEFAULT NULL, PRIMARY KEY (`sensor_id`), KEY `sensor_host` (`device_id`), KEY `sensor_class` (`sensor_class`), KEY `sensor_type` (`sensor_type`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `services` ( `service_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `service_ip` text NOT NULL, `service_type` varchar(16) NOT NULL, `service_desc` text NOT NULL, `service_param` text NOT NULL, `service_ignore` tinyint(1) NOT NULL, `service_status` tinyint(4) NOT NULL DEFAULT '0', `service_checked` int(11) NOT NULL DEFAULT '0', `service_changed` int(11) NOT NULL DEFAULT '0', `service_message` text NOT NULL, `service_disabled` tinyint(1) NOT NULL DEFAULT '0', PRIMARY KEY (`service_id`), KEY `service_host` (`device_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `syslog` ( `device_id` int(11) DEFAULT NULL, `facility` varchar(10) DEFAULT NULL, `priority` varchar(10) DEFAULT NULL, `level` varchar(10) DEFAULT NULL, `tag` varchar(10) DEFAULT NULL, `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `program` varchar(32) DEFAULT NULL, `msg` text, `seq` bigint(20) unsigned NOT NULL AUTO_INCREMENT, PRIMARY KEY (`seq`), KEY `datetime` (`timestamp`), KEY `device_id` (`device_id`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `toner` ( `toner_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL DEFAULT '0', `toner_index` int(11) NOT NULL, `toner_type` varchar(64) NOT NULL, `toner_oid` varchar(64) NOT NULL, `toner_descr` varchar(32) NOT NULL DEFAULT '', `toner_capacity` int(11) NOT NULL DEFAULT '0', `toner_current` int(11) NOT NULL DEFAULT '0', PRIMARY KEY (`toner_id`), KEY `device_id` (`device_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ucd_diskio` ( `diskio_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `diskio_index` int(11) NOT NULL, `diskio_descr` varchar(32) CHARACTER SET latin1 NOT NULL, PRIMARY KEY (`diskio_id`), KEY `device_id` (`device_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `users` ( `user_id` int(11) NOT NULL AUTO_INCREMENT, `username` char(30) NOT NULL, `password` varchar(34) DEFAULT NULL, `realname` varchar(64) NOT NULL, `email` varchar(64) NOT NULL, `descr` char(30) NOT NULL, `level` tinyint(4) NOT NULL DEFAULT '0', `can_modify_passwd` tinyint(4) NOT NULL DEFAULT '1', PRIMARY KEY (`user_id`), UNIQUE KEY `username` (`username`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `users_prefs` ( `user_id` int(16) NOT NULL, `pref` varchar(32) NOT NULL, `value` varchar(128) NOT NULL, PRIMARY KEY (`user_id`), UNIQUE KEY `user_id.pref` (`user_id`,`pref`), KEY `pref` (`pref`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `vlans` ( `vlan_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) DEFAULT NULL, `vlan_vlan` int(11) DEFAULT NULL, `vlan_domain` text, `vlan_descr` text, PRIMARY KEY (`vlan_id`), KEY `device_id` (`device_id`,`vlan_vlan`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `vminfo` ( `id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `vm_type` varchar(16) NOT NULL DEFAULT 'vmware', `vmwVmVMID` int(11) NOT NULL, `vmwVmDisplayName` varchar(128) NOT NULL, `vmwVmGuestOS` varchar(128) NOT NULL, `vmwVmMemSize` int(11) NOT NULL, `vmwVmCpus` int(11) NOT NULL, `vmwVmState` varchar(128) NOT NULL, PRIMARY KEY (`id`), KEY `device_id` (`device_id`), KEY `vmwVmVMID` (`vmwVmVMID`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `vrfs` ( `vrf_id` int(11) NOT NULL AUTO_INCREMENT, `vrf_oid` varchar(256) NOT NULL, `vrf_name` varchar(128) DEFAULT NULL, `mplsVpnVrfRouteDistinguisher` varchar(128) DEFAULT NULL, `mplsVpnVrfDescription` text NOT NULL, `device_id` int(11) NOT NULL, PRIMARY KEY (`vrf_id`), KEY `device_id` (`device_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `bill_history` ( `bill_hist_id` int(11) NOT NULL AUTO_INCREMENT, `bill_id` int(11) NOT NULL, `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, `bill_datefrom` datetime NOT NULL, `bill_dateto` datetime NOT NULL, `bill_type` text NOT NULL, `bill_allowed` bigint(20) NOT NULL, `bill_used` bigint(20) NOT NULL, `bill_overuse` bigint(20) NOT NULL, `bill_percent` decimal(10,2) NOT NULL, `rate_95th_in` bigint(20) NOT NULL, `rate_95th_out` bigint(20) NOT NULL, `rate_95th` bigint(20) NOT NULL, `dir_95th` varchar(3) NOT NULL, `rate_average` bigint(20) NOT NULL, `rate_average_in` bigint(20) NOT NULL, `rate_average_out` bigint(20) NOT NULL, `traf_in` bigint(20) NOT NULL, `traf_out` bigint(20) NOT NULL, `traf_total` bigint(20) NOT NULL, `pdf` longblob, PRIMARY KEY (`bill_hist_id`), UNIQUE KEY `unique_index` (`bill_id`,`bill_datefrom`,`bill_dateto`), KEY `bill_id` (`bill_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;
CREATE TABLE IF NOT EXISTS `entPhysical_state` (  `device_id` int(11) NOT NULL,  `entPhysicalIndex` varchar(64) NOT NULL,  `subindex` varchar(64) DEFAULT NULL,  `group` varchar(64) NOT NULL,  `key` varchar(64) NOT NULL,  `value` varchar(255) NOT NULL,  KEY `device_id_index` (`device_id`,`entPhysicalIndex`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE IF NOT EXISTS `ports_vlans` ( `port_vlan_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `interface_id` int(11) NOT NULL, `vlan` int(11) NOT NULL, `baseport` int(11) NOT NULL, `priority` bigint(32) NOT NULL, `state` varchar(16) NOT NULL, `cost` int(11) NOT NULL, PRIMARY KEY (`port_vlan_id`), UNIQUE KEY `unique` (`device_id`,`interface_id`,`vlan`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;
CREATE TABLE IF NOT EXISTS `netscaler_vservers` ( `vsvr_id` int(11) NOT NULL AUTO_INCREMENT, `device_id` int(11) NOT NULL, `vsvr_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL, `vsvr_ip` varchar(128) COLLATE utf8_unicode_ci NOT NULL, `vsvr_port` int(8) NOT NULL, `vsvr_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL, `vsvr_state` varchar(32) COLLATE utf8_unicode_ci NOT NULL, `vsvr_clients` int(11) NOT NULL, `vsvr_server` int(11) NOT NULL, `vsvr_req_rate` int(11) NOT NULL, `vsvr_bps_in` int(11) NOT NULL, `vsvr_bps_out` int(11) NOT NULL, PRIMARY KEY (`vsvr_id`) ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
