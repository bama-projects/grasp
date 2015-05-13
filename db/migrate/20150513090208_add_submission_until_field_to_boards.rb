class AddSubmissionUntilFieldToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :submission_until, :datetime
  end
end
