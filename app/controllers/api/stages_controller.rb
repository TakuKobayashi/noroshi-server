class Api::StagesController < Api::BaseController
  def index
    @stages = Stage.where(token: params[:token]).includes(:user)
  end

  def create
    @users = User.where(id: params[:user_ids].split(","))
    Stage.transaction do
      @stage = @user.stages.create!(mst_stage_id: params[:mst_stage_id], clear: false, token: SecureRandom.hex)
      @users.each do |user|
        @stage.requests.create!(user_id: user.id)
      end
    end
  end

  def join
    stage = Stage.find_by!(user_id: params[:user_id], clear: false)
    request = stage.requests.find_by!(user_id: @user.id)
    Stage.transaction do
      request.destroy
      @new_stage = @user.stages.create!(mst_stage_id: stage.mst_stage_id, clear: false, token: stage.token)
    end
  end

  def next_stage
    stage = Stage.find_by!(id: params[:id])
    Stage.transaction do
      stage.update!(clear: true)
      next_stage = Mst::Stage.where("number > ?", stage.mst.number).order("number ASC").first
      @new_stage = @user.stages.create!(mst_stage_id: next_stage.id, clear: false, token: SecureRandom.hex)
    end
  end

  def continue
    stages = Stage.where(token: params[:token])
    Stage.transaction do
      Gimmick.where(stage_id: stages.pluck(:id)).destroy_all
    end
    head(:ok)
  end

  def logout
    stage = @user.stages.find_by!(token: params[:token])
    stage.destroy
    head(:ok)
  end
end