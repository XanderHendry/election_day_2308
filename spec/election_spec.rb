require 'spec_helper'
require 'pry'

RSpec.describe Election do
  let(:election) { Election.new("2023") }
  it 'can #initialize' do
    expect(election).to be_a(Election)
    expect(election.year).to eq("2023")
    expect(election.races).to eq([])
  end

  describe '#add_race' do
    it 'will add a Race to the election' do
      race = election.add_race("Texas Governor")
      expect(race).to be_a(Race)
      expect(race.office).to eq("Texas Governor")
      expect(election.races).to eq([race])
    end
  end

  describe '#candidates' do
    it 'will return an array of all Candidate objects in the Election' do
      election.add_race("Texas Governor")
      candidate1 = election.races[0].register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = election.races[0].register_candidate!({name: "Roberto R", party: :republican})
      expect(election.candidates).to eq([candidate1, candidate2])
    end

    it 'will work with multiple races in the election' do
      election.add_race("Texas Governor")
      election.add_race("Texas Senate")
      candidate1 = election.races[0].register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = election.races[0].register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = election.races[1].register_candidate!({name: "Chris L", party: :democrat})
      candidate4 = election.races[1].register_candidate!({name: "Richard P", party: :republican})
      expect(election.candidates).to eq([candidate1, candidate2, candidate3, candidate4])
    end
  end

  describe '#vote_counts' do
    it 'will return a hash with each canidates name asa key and their count of votes as the value' do
      election.add_race("Texas Governor")
      candidate1 = election.races[0].register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = election.races[0].register_candidate!({name: "Roberto R", party: :republican})
      candidate1.vote_for!
      candidate1.vote_for!
      candidate1.vote_for!
      candidate1.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      candidate2.vote_for!
      expect(election.vote_counts).to eq({"Diana D" => 4, "Roberto R" => 3})
    end
  end
end