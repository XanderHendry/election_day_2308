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

  describe '#open?' do
    it 'will return a boolean indicating whether the race is open or not, races are open by default' do
      expect(race.open?).to eq(true)
    end
  end

  describe '#close!' do
    it 'will close the race' do
      election.close!
      expect(election.open?).to eq(false)
    end
  end

  describe '#winner' do
    before(:each) do 
      @candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      @candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
    end
    it 'will return false if the race is still open' do
      expect(race.winner).to eq(false)
    end

    it 'will return the candidate with the most votes if not open' do
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate1.vote_for!
      @candidate2.vote_for!
      @candidate2.vote_for!
      @candidate2.vote_for!
      expect(race.winner).to eq(@candidate1)
    end
    10.times do
      it 'will return either candidate if there is a tie' do
        @candidate1.vote_for!
        @candidate1.vote_for!
        @candidate1.vote_for!
        @candidate1.vote_for!
        @candidate2.vote_for!
        @candidate2.vote_for!
        @candidate2.vote_for!
        expect(race.winner).to eq(@candidate1 || @candidate2)
      end
    end
  end

  describe '#tie?' do
    it 'will return a boolean indicating if two or more candidates received the highest number of votes.' do
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      candidate1.vote_for!
      expect(race.tie?).to eq(true)
      candidate2.vote_for!
      expect(race.tie?).to eq(true)
    end
  end
end