class ChangePollNameToUniquePoll < ActiveRecord::Migration[6.0]
  def change
    add_index :polls, :name, unique: true
  end
end
