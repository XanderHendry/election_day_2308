class Election
  attr_reader :year,
              :races
  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    race = Race.new(race)
    @races << race
    race
  end
end