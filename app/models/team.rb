class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :comp_teams, dependent: :destroy
  has_many :competitions, through: :comp_teams
  validates_presence_of :hometown, :nickname

end
