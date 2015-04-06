require_relative '../test_helper'

class FrontPageTest < FeatureTest
  def test_welcome_message
    visit '/'
    within("h1") do
    assert page.has_content?("Welcome to Skill Inventory")
  end
end
end
