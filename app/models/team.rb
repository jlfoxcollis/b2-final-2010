class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :comp_teams, dependent: :destroy
  has_many :competitions, through: :comp_teams
  validates_presence_of :hometown, :nickname

  def self.sort_by_age
    joins(:players).select('teams.*, AVG(players.age) as average').group(:id).order('average DESC')
  end
end
