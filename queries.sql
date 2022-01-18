--Count the voters per candidate and state
select 
	  ci.voted_pres_16
	, di.state
	, count(vi.case_id)
from voter_info vi
join voter_choice vc on vi.case_id = vc.case_id
join candidate_info ci on vc.candidate_id = ci.candidate_id
join ideological_leaning il on il.ideoId = vi.ideoId
join district_info di on vi.zipcode = di.zipcode
group by ci.voted_pres_16, di.state
order by count(vi.case_id) desc