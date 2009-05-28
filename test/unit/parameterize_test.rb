require 'test_helper'

class ParameterizeTest < ActiveSupport::TestCase
  test "normalizes special cases" do
    assert_equal 'sorensen', 'Sørensen'.parameterize
    assert_equal 'weierstrass', 'Weierstraß'.parameterize
  end

  test "delegates normalization of accented letters and friends" do
    assert_equal 'barca', 'Barça'.parameterize
    assert_equal 'campio', 'CAMPIÓ'.parameterize
  end
end
