class SkillManagementsController < ApplicationController
  before_action :set_personal_skill, only: [:edit, :update, :show, :index]
  before_action :set_skill_management, only: [:edit, :update]

  def show
  end

  def index
  end

  def edit
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

  def destroy
    skill_management = SkillManagement.find(params[:id])
    return unless skill_management.user_id == current_user.id
      skill_management.destroy # destroyメソッドを使用し対象のツイートを削除する。
      redirect_to skill_managements_path
  end

  def update
    authorize @skill_management
    @skill_management.update(skill_management_params)
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

  def set_skill_management
    @skill_management = SkillManagement.find(params[:id])
    @user = @skill_management.user_id
    return unless current_user.id != @user # 稼働管理投稿者のuser_idとログイン者を比較

    redirect_to  skill_managements_path       # 一覧ページにリダイレクトさせる
  end

end
