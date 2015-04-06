require_relative '../test_helper'
require 'byebug'

class SkillInventoryTest < Minitest::Test
  def create_skills(num)
    num.times do |x|
      SkillInventory.create({title: "my skill#{x}",
                    description: "something#{x}"})
      end
  end

  def test_it_creates_a_skill
    create_skills(1)

    skills = SkillInventory.all

    assert_equal 1, skills.count
    assert_equal Skill, skills[0].class
  end

  def test_can_return_all_skills
    create_skills(3)
    skills = SkillInventory.all
    assert_equal 3, skills.length
  end

  def test_can_find_skill_by_id
    create_skills(3)
    skill = SkillInventory.all.last
    assert_equal "my skill2", skill.title
  end

  def test_can_update_skill
    create_skills(3)
    last_skill = SkillInventory.all.last
    skill = SkillInventory.find(last_skill.id)
    assert_equal "my skill2", skill.title

    SkillInventory.update(skill.id, {title: "updated skill",
                        description: "updated description"})
    updated_skill = SkillInventory.find(skill.id)

    assert_equal "updated skill", updated_skill.title
    assert_equal "updated description", updated_skill.description
   end

  def test_can_destroy_a_skill
    create_skills(3)
    last_skill = SkillInventory.all.last

    SkillInventory.destroy(last_skill.id)

    assert_equal 2, SkillInventory.all.count
  end

  # def test_it_can_destroy_a_robot
  #   create_robots(5)
  #   assert_equal 5, RobotMaker.all.count
  #   last_robot = RobotMaker.all.last
  #
  #   RobotMaker.destroy(last_robot.id)
  #
  #   assert_equal 4, RobotMaker.all.count
  # end
end
