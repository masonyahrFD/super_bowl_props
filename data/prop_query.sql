with nfl_prop_full as (
    select
    left(gamedate,10) gamedate,
    season,week,prop_name,position,name,
    id as player_id,team, opp,
    fd, pinny, dk, czr, mgm
    from analyst_dev.nfl_prop_data
    union
    select
    left(gamedate,10) gamedate,
    season,week,prop_name,position,name,
    id as player_id,team, opp,
    fd, pinny, NULL as dk, NULL as czr, mgm
    from analyst_dev.nfl_prop_data_archive
),
prop_filt as (
    select *,
    coalesce(fd, pinny, dk, czr, mgm) as line
    from nfl_prop_full
    where prop_name in ('rush_yards', 'rec_yards', 'pass_yards', 'rec')
)
select * from prop_filt where line is not null