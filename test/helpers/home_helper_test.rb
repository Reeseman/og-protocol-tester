require 'test_helper'

class HomeHelperTest < ActionDispatch::IntegrationTest
  test 'the truth' do
    HomeHelper.open_graph_data('https://www.youtube.com/')
  end
end
