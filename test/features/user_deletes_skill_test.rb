require_relative '../test_helper'

class UserDeletesSkillTest<FeatureTest
  def test_delete_existing_skill

    SkillInventory.create({title: "Baking", description: "Delicious Cookies"})

    visit '/skills'
    click_link_or_button("Delete")

    assert_equal '/skills', current_path
    refute page.has_content?("Baking")
  end
end
