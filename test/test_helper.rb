ENV['SKILL_INVENTORY_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

class Minitest::Test
  def teardown
    SkillInventory.delete_all
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest<MiniTest::Test
  include Capybara::DSL
end
