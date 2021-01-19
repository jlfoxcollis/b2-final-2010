require 'rails_helper'

describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:comp_teams) }
    it { should have_many(:competitions).through(:comp_teams)}
  end

  describe 'validations' do
    it { should validate_presence_of :hometown }
    it { should validate_presence_of :nickname }
  end

  describe 'instance methods' do

  end

end
