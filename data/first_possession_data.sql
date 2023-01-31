select game_id,
defense_team_id as team_id,
1 as "first_possession"
from nfl_plays
where quarter = 1 and time_left_in_quarter = '15:00'
and category = 'KICKOFF'
union
select game_id,
offense_team_id as team_id,
0 as "first_possession"
from nfl_plays
where quarter = 1 and time_left_in_quarter = '15:00'
and category = 'KICKOFF'