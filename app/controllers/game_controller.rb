class GameController < ApplicationController
  def index
    @season = ActiveRecord::Base.connection.execute(
      "select game_id,scorehome,scoreaway,name,home from games
      inner join homegames on games.id=homegames.game_id
      inner join teams on teams.id=homegames.team_id")
  end
end
