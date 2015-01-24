class Api::GimmicksController < Api::BaseController
  before_filter :load_stage

  def index
    @gimmicks = Gimmick.where(stage: Stage.where(token: @stage.token), turn_number: params[:turn_number]).includes(:stage)
  end

  def create
    @gimmick = @stage.gimmicks.find_or_initialize_by(user_id: @user.id, turn_number: params[:turn_number])
    Gimmick.transaction do
      @gimmick.mst_gimmick_id = params[:mst_gimmick_id]
      @gimmick.position_x = params[:position_x]
      @gimmick.position_y = params[:position_y]
      @gimmick.save!
    end
  end

  private
  def load_stage
    @stage = @user.stages.where(token: params[:token]).first
  end
end
