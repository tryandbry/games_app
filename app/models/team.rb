class Team < ActiveRecord::Base
  has_many :homegames
  has_many :games, through: :homegames
end
