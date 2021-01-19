require 'rails_helper'

describe Player do
  describe 'relationships' do
    it { should belong_to(:team) }
    it { should have_many(:comp_teams).through(:team) }
    it { should have_many(:competitions).through(:comp_teams)}
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_numericality_of :age }
  end

  describe 'instance methods' do

  end

end
