# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :last_name, :username, :age, presence: true
  validates :age, comparison: { greater_than: 17 }
end
