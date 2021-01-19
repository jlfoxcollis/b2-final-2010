require 'rails_helper'

describe Competition do
  describe 'relationships' do
    it { should have_many(:comp_teams) }
    it { should have_many(:teams).through(:comp_teams)}
    it { should have_many(:players).through(:teams) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :sport }
  end

  describe 'instance methods' do
    it '#avg_age_of_players' do
      @comp = create(:competition)
      @team1 = create(:team)
      @team2 = create(:team)
      create(:player, team: @team1, age: 5)
      create(:player, team: @team2, age: 5)
      create(:player, team: @team1, age: 5)
      @comp_team1 = CompTeam.create(team: @team1, competition: @comp)
      @comp_team2 = CompTeam.create(team: @team2, competition: @comp)
      expect(@comp.avg_age_of_players).to eq(5.0)
    end
  end
end
