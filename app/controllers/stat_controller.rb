class StatController < ApplicationController
  def immabear
    @test1 = Game
      .joins(:homegames)
      .joins("left join #{:teams} on #{:teams}.id = #{:homegames}.team_id")
      .group("#{:teams}.name","#{:homegames}.home")
      .select(
        "#{:teams}.name",
        "#{:homegames}.home",
        "count(#{:games}.id) as gamecount",
        "(case #{:homegames}.home
            when 't' then avg(scorehome)
            when 'f' then avg(scoreaway)
          end) as scoreavg",
        "abs(sum(scorehome)-sum(scoreaway)) / count(games.id) as deltaavg"
      )
    @season = @test1

=begin
    @season = Game
      .joins(:teams,:homegames)
      .group("#{:teams}.name","#{:homegames}.home")
      .select(
        "#{:teams}.name",
        "#{:homegames}.home",
        "count(#{:games}.id) as gamecount",
        "(case #{:homegames}.home
            when 't' then avg(scorehome)
            when 'f' then avg(scoreaway)
          end) as scoreavg",
        "abs(sum(scorehome)-sum(scoreaway)) / count(games.id) as deltaavg"
      )
=end

    #@season = {}
=begin
    @test1.each do |x|
      :teamName = x[:name]

      if @season[:teamName].include? then
        if x[:home] == 't' then
          @season[:teamName][:home] = {
            :scoreavg => x[:scoreavg],
            :deltaavg => x[:deltaavg]
          }
        else
          @season[:teamName][:away] = {
            :scoreavg => x[:scoreavg],
            :deltaavg => x[:deltaavg]
          }
        end
      end

    end
=end

=begin
    @season = Game.joins(:teams).select(
      :id,
      :scorehome,
      :scoreaway,
      "#{:teams}.name",
      "#{:homegames}.home",
    )
    #@test1 = @season
=end
  end
end
