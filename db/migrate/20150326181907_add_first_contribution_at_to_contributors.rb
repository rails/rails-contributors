class AddFirstContributionAtToContributors < ActiveRecord::Migration
  def up
    add_column :contributors, :first_contribution_at, :datetime
    Contributor.fill_missing_first_contribution_timestamps
  end

  def down
    remove_column :contributors, :first_contribution_at
  end
end
