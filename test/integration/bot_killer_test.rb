require 'test_helper'

class BotKillerTest < ActionDispatch::IntegrationTest
  test 'MauiBot is blacklisted' do
    get '/', headers: { 'User-Agent' => 'MauiBot (crawler.feedback+wc@gmail.com)' }
    assert_response :not_found
  end

  test 'FAST Enterprise is blacklisted' do
    get '/', headers: { 'User-Agent' => 'FAST Enterprise Crawler/5.3.4 (crawler@fast.no)' }
    assert_response :not_found
  end

  test 'other user agents are not blacklisted' do
    get '/', headers: { 'User-Agent' => 'Foo' }
    assert_response :ok
  end
end
