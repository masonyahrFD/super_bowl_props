with nfl_prop_full as (
    select
    left(gamedate,10) gamedate,
    season,week,prop_name,position,name,
    id as player_id,team, opp, fd, nf
    from analyst_dev.nfl_prop_data
    union
    select
    left(gamedate,10) gamedate,
    season,week,prop_name,position,name,
    id as player_id,team, opp, fd, nf
    from analyst_dev.nfl_prop_data_archive
),
rush_rec_prop as (
    select *,
    coalesce(fd, nf) as line
    from nfl_prop_full
    where prop_name in ('rush_yards', 'rec_yards', 'pass_yards')
)
select * from rush_rec_prop