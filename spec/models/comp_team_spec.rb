require 'rails_helper'

describe CompTeam do
  describe 'relationships' do
    it { should belong_to(:team) }
    it { should belong_to(:competition) }
    it { should have_many(:players).through(:team)}
  end

  describe 'instance methods' do

  end

end
