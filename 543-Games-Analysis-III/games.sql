select player_id,event_date,
sum(games_played) over (
  partition by player_id 
  order by event_date
  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as sum_games
from activity
