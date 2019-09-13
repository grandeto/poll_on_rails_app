class ChangeVotesDefaultValuePollOptions < ActiveRecord::Migration[6.0]
  def change
    change_column_default :poll_options, :votes, from: nil, to: 0
    change_column_null :poll_options, :votes, false
    change_column_null :poll_options, :option, false
    change_column_null :poll_options, :priority, false
  end
end
