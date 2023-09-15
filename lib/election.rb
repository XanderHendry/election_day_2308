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
  
  def candidates
    candidates = @races.flat_map { |race| race.candidates }
  end

  def vote_counts
    votes = {}
    @races.each do |race|
      race.candidates.each { |candidate| votes[candidate.name] = candidate.votes}
    end
    votes
  end
end