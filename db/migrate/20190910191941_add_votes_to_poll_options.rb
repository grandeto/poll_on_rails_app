class AddVotesToPollOptions < ActiveRecord::Migration[6.0]
  def change
    add_column :poll_options, :votes, :integer
  end
end
