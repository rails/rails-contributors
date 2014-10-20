class AddEmailsToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :author_email, :string
    add_column :commits, :committer_email, :string
  end
end
