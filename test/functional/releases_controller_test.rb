require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success

    assert_select 'span.listing-total', 'Showing 5 releases'

    expected = %w(
      v3_2_0
      v2_3_2_1
      v2_3_2
      v1_0_0
      v0_14_4
    ).map {|_| releases(_)}

    actual = assigns(:releases)
    
    assert_equal expected.size, actual.size
    expected.zip(assigns(:releases)).each do |e, a|
      assert_equal e.tag, a.tag
      assert_equal e.commits.count, a.ncommits
      assert_equal e.contributors.count, a.ncontributors
    end

    assert_select 'span.listing-total', 'Showing 5 releases'
    assert_select 'li.current', 'Releases'
  end
end
