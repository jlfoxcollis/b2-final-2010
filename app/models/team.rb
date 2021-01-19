class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :comp_teams, dependent: :destroy
  has_many :competitions, through: :comp_teams
  validates_presence_of :hometown, :nickname

  def avg_age_of_players
    avg_age = players.sum(:age)
  end

  def self.sort_by_age
    joins(:players).select('teams.*, SUM(players.age) as average').group(:id).order('average DESC')
  end
end
