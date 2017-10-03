class Team < ActiveRecord::Base
  has_many :game, as :teamhome
  has_many :game, as :teamaway
end
