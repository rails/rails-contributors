require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  def test_github_url_for_sha1
    sha1 = 'd4ab03a8f3c1ea8913ed76bb8653dd9bef6a894f'
    assert_equal "https://github.com/rails/rails/commit/#{sha1}", github_url_for_sha1(sha1)
  end

  def test_github_url_for_tag
    tag = 'v4.2.1'
    assert_equal "https://github.com/rails/rails/tree/#{tag}", github_url_for_tag(tag)
  end
end
