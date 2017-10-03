class Game < ActiveRecord::Base
  has_many :homegames
  has_many :teams, through: :homegames
end
