require 'rails_helper'

describe 'competition index page' do
  describe 'when I visit the competitions index page' do
    before :each do
      5.times do
        create(:competition)
      end
    end


    it 'can show all competition names and each name is a link' do
      visit competitions_path

      within("#competition-#{Competition.first.id}") do
        expect(page).to have_link(Competition.first.name)
      end

      within("#competition-#{Competition.second.id}") do
        expect(page).to have_link(Competition.second.name)
      end
    end
  end
end
