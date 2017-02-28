INSERT INTO `config` (config_name,config_value,config_default,config_descr,config_group,config_group_order,config_sub_group,config_sub_group_order,config_hidden,config_disabled) VALUES ('alert.macros.rule.bill_quota_over_quota','((%bills.total_data/%bills.bill_quota) * 100) && %bills.bill_type = "quota"','((%bills.total_data/%bills.bill_quota) * 100) && %bills.bill_type = "quota"','Quota bills over X perc of quota','alerting',0,'macros',0,1,0);
INSERT INTO `config` (config_name,config_value,config_default,config_descr,config_group,config_group_order,config_sub_group,config_sub_group_order,config_hidden,config_disabled) VALUES ('alert.macros.rule.bill_cdr_over_quota','((%bills.rate_95th/%bills.bill_cdr) * 100) && %bills.bill_type = "cdr"','((%bills.rate_95th/%bills.bill_cdr) * 100) && %bills.bill_type = "cdr"','CDR bills over X perc of quota','alerting',0,'macros',0,1,0);
