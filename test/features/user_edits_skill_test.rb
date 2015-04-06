require_relative '../test_helper'

class UserEditsSkillTest<FeatureTest
  def test_edit_existing_skill

    SkillInventory.create({title: "Baking", description: "Delicious Cookies"})

    visit '/skills'
    click_link_or_button("Edit")
    fill_in("skill[title]", with: "Eating")
    click_link_or_button("edit")

    refute page.has_content?("Baking")
    assert page.has_content?("Eating")
  end
end
