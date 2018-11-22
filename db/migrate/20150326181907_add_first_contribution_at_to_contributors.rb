class AddFirstContributionAtToContributors < ActiveRecord::Migration[4.2]
  def up
    add_column :contributors, :first_contribution_at, :datetime
    Contributor.try(:fill_missing_first_contribution_timestamps)
  end

  def down
    remove_column :contributors, :first_contribution_at
  end
end
