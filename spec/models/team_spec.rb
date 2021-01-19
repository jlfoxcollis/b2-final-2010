require 'rails_helper'

describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:comp_teams) }
    it { should have_many(:competitions).through(:comp_teams)}
  end

  describe 'validations' do
    it { should validate_presence_of :hometown }
    it { should validate_presence_of :nickname }
  end

  describe 'instance methods' do
    it 'can sort by age' do
      @team1 = create(:team)
      2.times do
        create(:player, age: 5, team: @team1)
      end
      @team2 = create(:team)
      2.times do
        create(:player, age: 10, team: @team2)
      end
      @team3 = create(:team)
      2.times do
        create(:player, age: 2, team: @team3)
      end

      expect(Team.all.sort_by_age).to eq([@team2, @team1, @team3])
    end
  end

end
