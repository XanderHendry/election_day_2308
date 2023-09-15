class Race
  attr_reader :office,
              :candidates
  def initialize(office)
    @office = office
    @candidates = []
  end

  def register_candidate!(candidate_info)
    candidate = Candidate.new(candidate_info)
    @candidates << candidate
    candidate
  end
end