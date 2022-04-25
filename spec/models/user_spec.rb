# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(User, type: :model) do
  describe '#create' do
    subject(:user) { create(:user) }

    it 'exists in the database' do
      expect(user).to be_a_kind_of(described_class)
      expect(described_class.count).to eq(1)

      expect(user.name).to eq('Paco')
      expect(user.last_name).to eq('Garcia')
      expect(user.username).to eq('Pako')
      expect(user.age).to eq(40)
      expect(user.id).to eq(1)
    end
  end
end
