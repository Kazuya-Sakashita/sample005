class Form::SkillManagementCollection < Form::Base
  FORM_COUNT = 10 # 作成した投稿フォーム数
  attr_accessor :skill_managements

  def initialize(attributes = {})
    super attributes
    self.skill_managements = FORM_COUNT.times.map { SkillManagement.new } unless skill_managements.present?
  end

  def skill_managements_attributes=(attributes)
    self.skill_managements = attributes.map { |_, v| SkillManagement.new(v) }
  end

  def save
    SkillManagement.transaction do
      skill_managements.map do |skill|
        skill.save if skill.availability # ここでチェックボックスにチェックを入れているスキルのみが保存される
      end
    end
    true
  rescue StandardError => e
    false
  end
end
