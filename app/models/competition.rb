class Competition < ApplicationRecord
  has_many :comp_teams
  has_many :teams, through: :comp_teams
  has_many :players, through: :teams

  validates_presence_of :name, :location, :sport


  def avg_age_of_players
    players.sum(:age)
  end
end
