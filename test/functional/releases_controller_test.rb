require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success

    assert_select 'span.listing-total', 'Showing 5 releases'

    fixtures = %w(
      v3_2_0
      v2_3_2_1
      v2_3_2
      v1_0_0
      v0_14_4
    ).map {|_| releases(_)}

    fixtures.zip(assigns(:releases)).each do |fixture, release|
      assert_equal fixture.tag, release.tag
      assert_equal fixture.commits.count, release.ncommits
      assert_equal fixture.contributors.count, release.ncontributors
    end

    assert_select 'span.listing-total', 'Showing 5 releases'
    assert_select 'li.current', 'Releases'
  end
end
