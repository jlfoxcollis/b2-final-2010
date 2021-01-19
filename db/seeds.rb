# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.destroy_all
Competition.destroy_all
Player.destroy_all

@comp = FactoryBot.create(:competition)

@team1 = FactoryBot.create(:team)
2.times do
  FactoryBot.create(:player, age: 5, team: @team1)
end
@team2 = FactoryBot.create(:team)
2.times do
  FactoryBot.create(:player, age: 10, team: @team2)
end
@team3 = FactoryBot.create(:team)
2.times do
  FactoryBot.create(:player, age: 2, team: @team3)
end

@comp_team1 = CompTeam.create(team: @team1, competition: @comp)
@comp_team2 = CompTeam.create(team: @team2, competition: @comp)
