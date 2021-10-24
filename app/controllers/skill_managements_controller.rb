class SkillManagementsController < ApplicationController
  before_action :set_personal_skill, only: %w[edit show index update]

  def show
  end

  def inde

  end

  def edit
    @skill_managements = SkillManagement.find(params[:id])
  end

  def new
    @form = Form::SkillManagementCollection.new
  end

  def create
    @form = Form::SkillManagementCollection.new(skill_management_collection_params)
    if @form.save
      redirect_to skill_managements_path, notice: 'skillを登録しました'
    else
      flash.now[:alert] = 'skill登録に失敗しました'
      render :new
    end
  end

  
  def update
    @skill_managements = SkillManagement.find(params[:id])
    @skill_managements.update(skill_management_params)
    redirect_to skill_managements_path
  end

  private

  def skill_management_collection_params
    params.require(:form_skill_management_collection)
          .permit(skill_managements_attributes: [:user_id, :skill_id, :skill_level, :availability])
  end

  def skill_management_params
    params.require(:skill_management)
          .permit(:user_id, :skill_id, :skill_level, :availability)
  end

  def set_personal_skill
    @personal_skill = SkillManagement.where(user_id: current_user.id)
  end
end
