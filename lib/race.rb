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
      votes = @candidates.map { |candidate| candidate.votes}
      highest_count = votes.max
      winner = @candidates.find {|candidate| candidate.votes == highest_count}
    end
  end

  def tie?
    votes = @candidates.map { |candidate| candidate.votes }
    votes[0] == votes [1]
  end
end