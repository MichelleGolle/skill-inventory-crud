require 'sequel'

class SkillInventory

  def self.database
    if ENV["SKILL_INVENTORY_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.create(skill)
    dataset.insert ({ title: skill[:title],
      description: skill[:description]
      })
  end

  def self.all
    dataset.map { |data| Skill.new(data) }
  end

  def self.find(id)
    Skill.new(dataset.where(id: id).to_a.first)
  end

  def self.update(id, skill)
    dataset.where(id: id).update({ title: skill[:title],
                                    description: skill[:description]

      })
  end

  def self.destroy(id)
    dataset.where(id: id).delete
  end

  def self.delete_all
    dataset.from(:skills).delete
  end

  private

  def self.dataset
    database.from(:skills)
  end

end
