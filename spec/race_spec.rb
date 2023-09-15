require 'spec_helper'

RSpec.describe Race do
  let(:race) { Race.new("Texas Governor") }

  it 'can initialize' do
    expect(race).to be_a(Race)
    expect(race.office).to eq("Texas Governor")
    expect(race.candidates).to eq([])
  end

  describe '#register_candidate!' do
    before(:each) do 
      @candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    end

    it 'will add a new Candidate to the race' do
      expect(@candidate1.class).to eq(Candidate)
      expect(@candidate1.name).to eq("Diana D")
      expect(@candidate1.party).to eq(:democrat)
      expect(@candidate2.class).to eq(Candidate)
      expect(@candidate2.name).to eq("Roberto R")
      expect(@candidate2.party).to eq(:republican)
      expect(race.candidates).to eq([@candidate1, @candidate2])
    end
  end
end