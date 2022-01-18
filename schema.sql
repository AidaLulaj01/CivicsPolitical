
-- Creating tables
CREATE TABLE candidate_info (
	  candidate_id int NOT NULL
	, voted_pres_16 varchar(200)
	, voted_pres_party varchar(200)
	, PRIMARY KEY (candidate_id)
	, UNIQUE (voted_pres_16)
);

CREATE TABLE district_info (
      zipcode varchar(20) 
	, state varchar(20)
	, st varchar(20)
	, cong int
	, cong_up int
	, dist int
	, dist_up int
	, cd varchar(20)
	, cd_up varchar(20) 
	, county_fips varchar(20)
    , PRIMARY KEY (zipcode)
	, UNIQUE (zipcode)
);

CREATE TABLE ideological_Leaning (
	  ideoId int NOT NULL
	, ideo5 varchar(20) NOT NULL
	, PRIMARY KEY (ideoId)
	, UNIQUE (ideo5)
);

CREATE TABLE voter_info (
  	  case_id int
	, year varchar(4)
	, weight numeric(28, 16)
	, weight_cumulative numeric(28, 16)
	, gender varchar(20)
	, birthyr varchar(4)
	, age int
	, race varchar(20)
	, hispanic varchar(20)
	, citizen varchar(20)
	, educ int
	, marstat varchar(20)
	, faminc varchar(20)
	, union_ varchar(20)
	, union_hh varchar(20)
	, employ varchar(20)
	, no_healthins varchar(20)
	, has_child varchar(20)
	, ownhome varchar(20)
	, no_milstat varchar(20)
	, religion varchar(20)
	, economy_retro varchar(20)
	, newsint varchar(20)
	, zipcode varchar(20)
	, ideoId int
	, FOREIGN KEY (ideoId) REFERENCES ideological_Leaning (ideoId)
	, FOREIGN KEY (zipcode) REFERENCES district_info (zipcode)
	, PRIMARY KEY (case_id)
);

CREATE TABLE voter_choice (
  	  case_id INT NOT NULL
	, approval_pres varchar(200)
	, approval_rep varchar(200)
	, approval_sen1 varchar(200)
	, approval_sen2 varchar(200)
	, approval_gov varchar(200)
	, intent_pres_08 varchar(200)
	, intent_pres_12 varchar(200)
	, intent_pres_16 varchar(200) 
	, intent_pres_20 varchar(200)
	, voted_pres_08 varchar(200)
	, voted_pres_12 varchar(20)
	, vv_regstatus varchar(200)
	, vv_party_gen varchar(200)
	, vv_party_prm varchar(200)
	, vv_turnout_gvm varchar(200)
	, vv_turnout_pvm varchar(200)
	, intent_rep varchar(200)
	, intent_rep_party varchar(200)
	, voted_rep varchar(200)
	, voted_rep_party varchar(200)
	, intent_gov varchar(200)
	, intent_gov_party varchar(200)
	, voted_gov varchar(200)
	, voted_gov_party varchar(200)
	, intent_sen varchar(200)
	, intent_sen_party  varchar(200)
	, voted_sen varchar(200)
	, voted_sen_party varchar(200)
	, intent_rep_chosen varchar(200)
	, intent_sen_chosen varchar(200)
	, intent_gov_chosen varchar(200)
	, voted_rep_chosen varchar(200)
	, voted_sen_chosen varchar(200)
	, voted_gov_chosen varchar(200)
	, rep_current varchar(200)
	, rep_icpsr varchar(200)
	, sen1_current varchar(200)
	, sen1_icpsr varchar(200)
	, sen2_current varchar(200)
	, sen2_icpsr varchar(200)
	, gov_current varchar(200)
	, candidate_id int 
	, FOREIGN KEY (case_id) REFERENCES voter_info (case_id)
	, FOREIGN KEY (candidate_id) REFERENCES candidate_info (candidate_id)
 	, PRIMARY KEY (case_id)
);

/*
select * from candidate_info;
select * from district_info;
select * from ideological_leaning;
select * from voter_choice;
select * from voter_info;
select * from all_data;
*/

/*--Remove tables if necessary
drop table voter_choice;
drop table voter_info;
drop table candidate_info;
drop table ideological_Leaning;
drop table district_info;*/

/*
CREATE TABLE all_data (
      year varchar(4)
	, case_id int 
	, weight numeric(28, 16)
	, weight_cumulative numeric(28, 16)
	, state varchar(20)
	, st varchar(2)
	, cong int
	, cong_up int
	, state_post varchar(20)
	, st_post varchar(2)
	, dist int
	, dist_up int
	, cd varchar(20)
	, cd_up varchar(20)
	, dist_post varchar(20)
	, dist_up_post varchar(20)
	, cd_post varchar(20)
	, cd_up_post varchar(20)
	, zipcode varchar(20)
	, county_fips varchar(20)
	, tookpost bool
	, weight_post numeric(28, 16)
	, rvweight numeric(28, 16)
	, rvweight_post numeric(28, 16)
	, starttime timestamp(8)
	, pid3 varchar(20)
	, pid3_leaner varchar(20)
	, pid7 varchar(20)
	, ideo5 varchar(20)
	, gender int
	, birthyr varchar(4)
	, age int
	, race int
	, hispanic varchar(20)
	, citizen varchar(20)
	, educ int
	, marstat varchar(20)
	, faminc varchar(20)
	, union_ varchar(20)
	, union_hh varchar(20)
	, employ varchar(20)
	, no_healthins varchar(20)
	, has_child varchar(20)
	, ownhome varchar(20)
	, no_milstat varchar(20)
	, religion varchar(20)
	, economy_retro varchar(20)
	, newsint varchar(20)
	, approval_pres varchar(200)
	, approval_rep varchar(200)
	, approval_sen1 varchar(200)
	, approval_sen2 varchar(200)
	, approval_gov varchar(200)
	, intent_pres_08 varchar(200)
	, intent_pres_12 varchar(200)
	, intent_pres_16 varchar(200)
	, intent_pres_20 varchar(200)
	, voted_pres_08 varchar(200)
	, voted_pres_12 varchar(200)
	, voted_pres_16 varchar(200)
	, voted_pres_20 varchar(200)
	, intent_pres_party varchar(20)
	, voted_pres_party varchar(200)
	, vv_regstatus varchar(200)
	, vv_party_gen varchar(200)
	, vv_party_prm varchar(200)
	, vv_turnout_gvm varchar(200)
	, vv_turnout_pvm varchar(200)
	, intent_rep varchar(200)
	, intent_rep_party varchar(200)
	, voted_rep varchar(200)
	, voted_rep_party varchar(200)
	, intent_gov varchar(200)
	, intent_gov_party varchar(200)
	, voted_gov varchar(200)
	, voted_gov_party varchar(200)
	, intent_sen varchar(200)
	, intent_sen_party varchar(200)
	, voted_sen varchar(200)
	, voted_sen_party varchar(200)
	, intent_rep_chosen varchar(200)
	, intent_sen_chosen varchar(200)
	, intent_gov_chosen varchar(200)
	, voted_rep_chosen varchar(200)
	, voted_sen_chosen varchar(200)
	, voted_gov_chosen varchar(200)
	, rep_current varchar(200)
	, rep_icpsr varchar(200)
	, sen1_current varchar(200) 
	, sen1_icpsr varchar(200)
	, sen2_current varchar(200)
	, sen2_icpsr varchar(200)
	, gov_current varchar(200)
	, candidate_id int
	, ideoId int
	, PRIMARY KEY (case_id)
);*/