class AddLastContributionAtToContributors < ActiveRecord::Migration[7.1]
  def up
    add_column :contributors, :last_contribution_at, :datetime
    Contributor.set_last_contribution_timestamps
  end

  def down
    remove_column :contributors, :last_contribution_at
  end
end
