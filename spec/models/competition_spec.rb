require 'rails_helper'

describe Competition do
  describe 'relationships' do
    it { should have_many(:comp_teams) }
    it { should have_many(:teams).through(:comp_teams)}
    it { should have_many(:players).through(:teams) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :sport }
  end

  describe 'instance methods' do

  end

end
