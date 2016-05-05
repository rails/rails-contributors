require 'test_helper'

module Credits
  class HeuristicsTest < ActiveSupport::TestCase
    include AssertContributorNames

    # Example from 1c47d04:
    #
    #   Added Object#presence that returns the object if it's #present? otherwise returns nil [DHH/Colin Kelley]
    #
    test 'captures credit at the end of the subject' do
      assert_contributor_names '1c47d04', 'David Heinemeier Hansson', 'Colin Kelley'
    end

    # Example from 9e9793b:
    #
    #   do not trigger AR lazy load hook before initializers ran.
    #
    #   [Rafael Mendonça França & Yves Senn]
    #
    #   This require caused the `active_record.set_configs` initializer to
    #   ...
    #
    test 'captures credit in an isolated line' do
      # First line in body.
      assert_contributor_names '9e9793b', 'Rafael Mendonça França', 'Yves Senn'

      # Line in the middle.
      assert_contributor_names '2a67e12', 'Matthew Draper', 'Yves Senn'

      # There are multiple lines with [...], only one of them has credits.
      assert_contributor_names '84c0f73', 'Godfrey Chan', 'Xavier Noria'
    end

    # Example from ec20838:
    #
    #   diff --git a/activerecord/CHANGELOG b/activerecord/CHANGELOG
    #   index b793bda..b76db7c 100644
    #   --- a/activerecord/CHANGELOG
    #   +++ b/activerecord/CHANGELOG
    #   @@ -1,5 +1,7 @@
    #    *SVN*
    #
    #   +* ActiveRecord::Base.remove_connection explicitly ...  welcome.  #3591 [Simon Stapleton, Tom Ward]
    #   +
    #   ...
    #
    test 'captures credit from CHANGELOGs in commits imported from Subversion' do
      assert_contributor_names 'ec20838', 'Simon Stapleton', 'Tom Ward'
      assert_contributor_names 'cf656ec', 'Christopher Cotton'
      assert_contributor_names '532d4e8', 'Michael Schoen'
      assert_contributor_names 'c95365a', 'Geoff Buesing'
      assert_contributor_names '8dea60b', 'Vitaly Kushner'
    end

    # Example from 71528b1:
    #
    #   Previously we only added the "lib" subdirectory to the load path when
    #   setting up gem dependencies for frozen gems. Now we add the "ext"
    #   subdirectory as well for those gems which have compiled C extensions
    #   as well. [Wincent Colaiuta]
    #
    #   [#268 state:resolved]
    #
    test 'subject is defined by two consecutive newlines' do
      assert_contributor_names '71528b1', 'Wincent Colaiuta'
    end

    # Example from bf0f145:
    #
    #   let the rails command recurse upwards looking for script/rails, and exec ruby on it for better portability [Xavier Noria] (Closes #4008)
    #
    # These were common in the SVN days.
    test 'eventual trailing "(Closes #nnn)" are ignored' do
      assert_contributor_names 'bf0f145', 'Xavier Noria'
    end

    # Example from 41bfede:
    #
    #   Tidy up framework initialization code to ensure that it doesn't add folders to the load path that it doesn't intend to require.
    #
    #   Work around mongrel swallowing LoadErrors to ensure that users get more helpful errors if active_resource is required but not missing.  [mislav] Closes #9
    #
    #
    #   git-svn-id: http://svn-commit.rubyonrails.org/rails/trunk@7738 5ecf4fe2-1ee6-0310-87b1-e25e094e27de
    #
    test 'captures credit at the end of the body message of commits imported from Subversion' do
      assert_contributor_names '03d37a2', 'Tobias Lütke'
      assert_contributor_names '41bfede', 'Mislav Marohnić'
    end

    # Example from 4e873ff:
    #
    #   commit 4e873ffcdab0c445e2211db1d27ddd5b349f7913
    #   Author:  <JRadosz@gmail.com>
    #   Date:   Tue Apr 12 00:59:55 2011 -0700
    #   ...
    #
    test 'captures credit from email if author name is empty' do
      assert_contributor_names '4e873ff', 'Jarek Radosz'
    end

    test 'fallback to the author name' do
      assert_contributor_names 'f756bfb', 'Jeremy Daer'
      assert_contributor_names 'cf6b13b', 'Carlos Antonio da Silva'
      assert_contributor_names '6033d2c', 'Iñigo Solano Pàez'
    end

    test 'committers get credit for commits imported from Subversion' do
      assert_contributor_names 'cf656ec', 'Christopher Cotton', 'Marcel Molina Jr.', equal: true
    end

    test 'committers get credit if they are not among the authors' do
      assert_contributor_names 'cacded5', 'Derek Prior', 'Kasper Timm Hansen', equal: true
    end
  end
end
