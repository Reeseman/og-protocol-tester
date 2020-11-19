require 'test_helper'

class HomeHelperTest < ActionDispatch::IntegrationTest
  test 'youtube open graph data' do
    data = HomeHelper.open_graph_data('https://www.youtube.com/')
    assert data['og:image'].present?
  end

  test 'imgur open graph data' do
    data = HomeHelper.open_graph_data('https://imgur.com/gallery/HSz0Lye')
    assert data['og:image'].present?
    assert data['og:site_name'].present?
    assert data['og:url'].present?
    assert data['og:image:width'].present?
    assert data['og:image:height'].present?
    assert data['og:type'].present?
  end

  test 'bad url' do
    data = HomeHelper.open_graph_data('asdf')
    assert data[:error].present?
  end
end
