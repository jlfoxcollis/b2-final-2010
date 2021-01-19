require 'rails_helper'

describe 'competition index page' do
  describe 'when I visit the competitions index page' do
    before :each do
      @comp = create(:competition)
      @team1 = create(:team)
      @team2 = create(:team)
      @comp_team1 = CompTeam.create(team: @team1, competition: @comp)
      @comp_team2 = CompTeam.create(team: @team2, competition: @comp)
      create(:player, team: @team1, age: 5)
      create(:player, team: @team2, age: 5)
      create(:player, team: @team1, age: 5)
    end


    it 'can show a competition, the teams, average age of all players and each name is a link' do
      visit competition_path(@comp)

      within("#competition-info") do
        expect(page).to have_content(@comp.name)
        expect(page).to have_content(@comp.location)
        expect(page).to have_content(@comp.sport)
        expect(page).to have_content(@comp.avg_age_of_players)
      end

      within("#team-#{@team1.id}") do
        expect(page).to have_content(@team1.nickname)
        expect(page).to have_content(@team1.hometown)
      end
      within("#team-#{@team2.id}") do
        expect(page).to have_content(@team2.nickname)
        expect(page).to have_content(@team2.hometown)
      end

    end
  end
end
