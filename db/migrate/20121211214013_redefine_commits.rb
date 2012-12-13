class RedefineCommits < ActiveRecord::Migration
  def change
    # Let's follow the vocabulary of Git.
    change_table(:commits) do |t|
      t.rename :author,              :author_name
      t.rename :authored_timestamp,  :author_date
      t.rename :committer,           :committer_name
      t.rename :committed_timestamp, :committer_date
      t.rename :git_show,            :diff
      t.remove :branch
    end
  end
end
