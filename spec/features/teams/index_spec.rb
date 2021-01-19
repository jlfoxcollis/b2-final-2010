require 'rails_helper'

describe 'teams index page' do
  describe 'when i visit the teams index' do
    before :each do
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
    end

    it 'can show all team names, and next to each team, the avg age of players' do

      visit teams_path

      within("#team-#{@team1.id}") do
        expect(page).to have_content(@team1.nickname)
        expect(page).to have_content(@team1.avg_age_of_players)
      end

      expect(@team2.nickname).to appear_before(@team1.nickname)
      expect(@team1.nickname).to appear_before(@team3.nickname)
    end
  end
end
