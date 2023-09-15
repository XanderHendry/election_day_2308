class Race
  attr_reader :office,
              :candidates
  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate_info)
    candidate = Candidate.new(candidate_info)
    @candidates << candidate
    candidate
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def winner
    if open?
      false
    else
      votes = { }
      @candidates.sort { |candidate| votes[candidate.name] = candidate.votes}
      highest_count = votes.values.max
      winner = @candidates.find {|candidate| candidate.votes == highest_count}
    end
  end
end