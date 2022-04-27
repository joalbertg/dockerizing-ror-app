# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table(:users, comment: 'Table of users') do |t|
      t.string(:name, null: false, comment: 'name of user')
      t.string(:last_name, null: false, comment: 'last name of user')
      t.string(:username, null: false, comment: 'username of user')
      t.integer(:age, null: false, comment: 'the user\'s age must be greater than or equal to 18 years')

      t.timestamps
    end
  end
end
