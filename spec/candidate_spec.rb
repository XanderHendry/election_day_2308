require 'spec_helper'

RSpec.describe Candidate do
  let(:diana) { Candidate.new({name: "Diana D", party: :democrat}) }

  it 'can #initialize' do
    expect(diana).to be_a(Candidate)
    expect(diana.name).to eq("Diana D")
    expect(diana.party).to eq(:democrat)
    expect(diana.votes).to eq(0) 
  end

  describe '#vote_for!' do
    it 'will add one vote at a time to the candidates votes' do
      diana.vote_for!
      diana.vote_for!
      diana.vote_for!
      expect(diana.votes).to eq(3)
      diana.vote_for!
      expect(diana.votes).to eq(4)
    end
  end
end