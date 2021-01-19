class Player < ApplicationRecord
  belongs_to :team
  has_many :comp_teams, through: :team
  has_many :competitions, through: :comp_teams
  validates_presence_of :name
  validates :age, numericality: { only_integer: true }, presence: true

end
