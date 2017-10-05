# games_app
My first Rails app, including controllers, views, and models written manually [without scaffolding].

## Views

controller#action | route | stats | tables | detail 
---- | --- | ----- | ------
game#index | / | games and scores | games, teams, homegames | filtered view game scores
stat#immabear | /numbers | score and score delta averages | games, teams, homegames | score averages and score delta averages by team and game type (i.e. home or away)
