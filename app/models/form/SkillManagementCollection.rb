class Form::SkillManagementCollection < Form::Base

    FORM_COUNT = 10 #作成した投稿フォーム数
    attr_accessor :skill_managements

    def initialize(attributes = {})
        super attributes
        self.skill_managements = FORM_COUNT.times.map { SkillManagement.new()} unless skill_managements.present?
    end

    def skill_managements_attributes=(attributes)
        self.skill_managements = attributes.map { |_, v| SkillManagement.new(v) }
    end

      def save
        SkillManagement.transaction do
          self.skill_managements.map do |skill|
            if skill.availability # ここでチェックボックスにチェックを入れているスキルのみが保存される
                skill.save
            end
          end
        end
        return true
    rescue => e
      return false
  end

end