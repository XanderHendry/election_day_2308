class Candidate
  attr_reader :name,
              :party,
              :votes
  def initialize(candidate_info)
    @name = candidate_info[:name]
    @party = candidate_info[:party]
    @votes = 0
  end

  def vote_for!
    @votes +=1
  end
end