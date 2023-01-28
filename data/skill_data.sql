select
skill.game_id, game.date as gamedate,
home_team_id, away_team_id,
initial_posessing_team, player_id,team_id,
rush_attempts,rush_yards,rush_tds,
rec,rec_yards,rec_tds
from nfl_statline_skill skill
inner join nfl_game game
    on game.id = skill.game_id
inner join (
    select
    game_id,
    possessing_team_id as initial_posessing_team
    from nfl_plays
    where category = 'KICKOFF'
    and quarter = 1
    and time_left_in_quarter = '15:00'
    order by game_id
) ipt on ipt.game_id = skill.game_id;

