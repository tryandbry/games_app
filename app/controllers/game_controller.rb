class GameController < ApplicationController
  def index
    @season = ActiveRecord::Base.connection.execute(
      "select game_id,scorehome,scoreaway,name,home from games
      inner join homegames on games.id=homegames.game_id
      inner join teams on teams.id=homegames.team_id")

  end
end


=begin
arr = [{"game_id"=>1, "scorehome"=>20, "scoreaway"=>21, "name"=>"Pikachu", "home"=>"t", 0=>1, 1=>20, 2=>21, 3=>"Pikachu", 4=>"t"}, {"game_id"=>1, "scorehome"=>20, "scoreaway"=>21, "name"=>"Squirtle", "home"=>"f", 0=>1, 1=>20, 2=>21, 3=>"Squirtle", 4=>"f"}, {"game_id"=>2, "scorehome"=>50, "scoreaway"=>11, "name"=>"Pikachu", "home"=>"t", 0=>2, 1=>50, 2=>11, 3=>"Pikachu", 4=>"t"}, {"game_id"=>2, "scorehome"=>50, "scoreaway"=>11, "name"=>"Rocket", "home"=>"f", 0=>2, 1=>50, 2=>11, 3=>"Rocket", 4=>"f"}, {"game_id"=>3, "scorehome"=>30, "scoreaway"=>19, "name"=>"Pikachu", "home"=>"t", 0=>3, 1=>30, 2=>19, 3=>"Pikachu", 4=>"t"}, {"game_id"=>3, "scorehome"=>30, "scoreaway"=>19, "name"=>"Squirtle", "home"=>"f", 0=>3, 1=>30, 2=>19, 3=>"Squirtle", 4=>"f"}, {"game_id"=>4, "scorehome"=>38, "scoreaway"=>36, "name"=>"Squirtle", "home"=>"t", 0=>4, 1=>38, 2=>36, 3=>"Squirtle", 4=>"t"}, {"game_id"=>4, "scorehome"=>38, "scoreaway"=>36, "name"=>"Rocket", "home"=>"f", 0=>4, 1=>38, 2=>36, 3=>"Rocket", 4=>"f"}, {"game_id"=>5, "scorehome"=>10, "scoreaway"=>21, "name"=>"Rocket", "home"=>"t", 0=>5, 1=>10, 2=>21, 3=>"Rocket", 4=>"t"}, {"game_id"=>5, "scorehome"=>10, "scoreaway"=>21, "name"=>"Pikachu", "home"=>"f", 0=>5, 1=>10, 2=>21, 3=>"Pikachu", 4=>"f"}, {"game_id"=>6, "scorehome"=>2, "scoreaway"=>100, "name"=>"Rocket", "home"=>"t", 0=>6, 1=>2, 2=>100, 3=>"Rocket", 4=>"t"}, {"game_id"=>6, "scorehome"=>2, "scoreaway"=>100, "name"=>"Squirtle", "home"=>"f", 0=>6, 1=>2, 2=>100, 3=>"Squirtle", 4=>"f"}]

def win?(row)
  if row["home"] == 't' && row["scorehome"] > row["scoreaway"] ||
     row["home"] == 'f' && row["scorehome"] < row["scoreaway"]
    return TRUE
  else
    return FALSE
  end
end

def score(row)
  if row["home"] == 't'
    return row["scorehome"]
  else
    return row["scoreaway"]
  end
end

def generateTeamRow(row)
  if win? row
    return {
      :game_id => row["game_id"],
      :win => TRUE,
      :score => score(row),
      :delta => (row["scorehome"] - row["scoreaway"]).abs
    }
  else
    return {
      :game_id => row["game_id"],
      :win => FALSE,
      :score => score(row),
      :delta => (row["scorehome"] - row["scoreaway"]).abs
    }
  end
end

@teams = {}

def addOrCreate(row)
  if @teams.include? row["name"]
    @teams[row["name"]] << generateTeamRow(row)
  else
    @teams[row["name"]] = [ generateTeamRow(row) ]
  end
end

arr.each do |row|
  addOrCreate(row)
end

def generateStats(team)
  total = team.length
  wins = 0 
  aggregateScore = 0
  aggregateDelta = 0
  
  team.each do |row|
    aggregateScore += row[:score]
    aggregateDelta += row[:delta]
    if row[:win]
      wins += 1
    end
  end
  puts "wins:",wins
  puts "wins average:", wins / total
  
  return {
    :winsAverage => wins / total,
    :scoreAverage => aggregateScore / total,
    :deltaAverage => aggregateDelta / total
  }
end

puts @teams["Pikachu"]
puts generateStats(@teams["Pikachu"])
=end
