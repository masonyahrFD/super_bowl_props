select player_id, game_id,
'rush_yards' as prop_name, 
rush_yards as actual_yards 
from nfl_statline_skill
union
select player_id, game_id,
'rec_yards' as prop_name, 
rec_yards as actual_yards 
from nfl_statline_skill
union
select player_id, game_id,
'pass_yards' as prop_name, 
pass_yards as actual_yards 
from nfl_statline_skill