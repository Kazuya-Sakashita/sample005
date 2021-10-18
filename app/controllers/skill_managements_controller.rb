class SkillManagementsController < ApplicationController
  def show
    @skill_management = SkillManagement.where(user_id: current_user.id)
  end

  def edit
  end

  def new
    @form = Form::SkillManagementCollection.new
  end

  def create
    @form = Form::SkillManagementCollection.new(skill_management_collection_params)
    if @form.save
      redirect_to skill_managements_path, notice: "skillを登録しました"
    else
      flash.now[:alert] = "skill登録に失敗しました"
      render :new
    end

  end

  private

    def skill_management_collection_params
        params.require(:form_skill_management_collection)
        .permit(skill_managements_attributes: [:user_id, :skill_id, :skill_level, :availability])
    end


end
