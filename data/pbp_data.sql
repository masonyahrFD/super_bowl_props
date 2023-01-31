select yards.*,
mx_pl.n_plays
from (
    select game_id, offense_team_id as team_id,
    play_number, receiver_id as player_id,
    'rec_yards' as prop_name, total_yards as value
    from nfl_plays where category = 'PASS'
    and is_complete_pass = 1
    union
    select game_id, offense_team_id as team_id,
    play_number, rusher_id as player_id,
    'rush_yards' as prop_name, total_yards as value
    from nfl_plays where category = 'RUSH'
    union
    select game_id, offense_team_id as team_id,
    play_number, passer_id as player_id,
    'pass_yards' as prop_name, total_yards as value
    from nfl_plays where category = 'PASS'
    and is_complete_pass = 1
    union
    select game_id, offense_team_id as team_id,
    play_number, receiver_id as player_id,
    'rec' as prop_name, 1 as value
    from nfl_plays where category = 'PASS'
    and is_complete_pass = 1
) yards
inner join (
    select game_id, max(play_number) n_plays
    from nfl_plays group by 1
) mx_pl on yards.game_id = mx_pl.game_id