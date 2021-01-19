require 'rails_helper'

describe 'competition index page' do
  describe 'when I visit the competitions index page' do
    before :each do
      @comp = create(:competition)
      @team1 = create(:team)
      @comp_team1 = CompTeam.create(team: @team1, competition: @comp)
    end

    it 'can register a new team' do
      visit competition_path(@comp)
      within(".navbar") do
        click_on "Register Team"
      end

      fill_in "team[nickname]", with: "The Jersey Devils"
      fill_in "team[hometown]", with: "Jersey"

      click_on "Create Team"

      expect(current_path).to eq(competition_path(@comp))

      within("#team-#{Team.last.id}") do
        expect(page).to have_content("The Jersey Devils")
        expect(page).to have_content("Jersey")
      end
    end
  end
end
