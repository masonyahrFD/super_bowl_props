select prop_name, position, mean, ou, under
from analyst_dev.nfl_prop_charts
where prop_name in ('rush_yards', 'rec_yards', 'pass_yards', 'rec')
