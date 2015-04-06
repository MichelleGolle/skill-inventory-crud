require_relative '../test_helper'

class UserCreatesSkillTest<FeatureTest
  def test_create_skill_with_title_and_description
    #as a guest
    #when I visit root path
    visit '/'
    #and I click on "new task"
    click_link_or_button("New Skill")
    #and I fill in the title with something
    fill_in("skill[title]", with: "Some Skill")
    #and I fill in the description with something
    fill_in("skill[description]", with: "Some Description")
    #and I click submit
    click_link_or_button("Add New Skill")
    #then I should see the new task title on task index
    assert_equal '/skills', current_path
    assert page.has_content?("Some Skill")
  end

  # def test_notitle_appears_when_user_does_not_enter_title
  #
  # end
end
