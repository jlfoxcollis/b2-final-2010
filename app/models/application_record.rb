class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def avg_age_of_players
    players.average(:age)
  end
end
