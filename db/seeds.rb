# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
teams = [
  {name: 'Pikachu'},
  {name: 'Squirtle'},
  {name: 'Rocket'},
]

Team.create(teams)

games = [
  {scorehome: 20, scoreaway: 21},
  {scorehome: 50, scoreaway: 11},
  {scorehome: 30, scoreaway: 19},
  {scorehome: 38, scoreaway: 36},
  {scorehome: 10, scoreaway: 21},
  {scorehome: 2, scoreaway: 100},
]

Game.create(games)

homeoraways = [
  {game_id: 1, team_id: 1, home: true},
  {game_id: 1, team_id: 2, home: false},
  {game_id: 2, team_id: 1, home: true},
  {game_id: 2, team_id: 3, home: false},
  {game_id: 3, team_id: 1, home: true},
  {game_id: 3, team_id: 2, home: false},
  {game_id: 4, team_id: 2, home: true},
  {game_id: 4, team_id: 3, home: false},
  {game_id: 5, team_id: 3, home: true},
  {game_id: 5, team_id: 1, home: false},
  {game_id: 6, team_id: 3, home: true},
  {game_id: 6, team_id: 2, home: false},
]

Homegame.create(homeoraways)
