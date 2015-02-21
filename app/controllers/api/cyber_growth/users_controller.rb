class Api::CyberGrowth::UsersController < Api::BaseController
  skip_before_filter :authentication

  def login
  	if params[:auth_token].blank?
      @user = CyberGrowthUser.new(auth_token: SecureRandom.hex)
    else
      @user = CyberGrowthUser.find_or_initialize_by(auth_token: params[:auth_token])
    end
    User.transaction do
      @user.session_token = SecureRandom.hex
      @user.name = params[:name].to_s
      @user.save!
    end
  end

  def save_data
    User.transaction do
      @user.admin_pp = params[:admin_pp]
      @user.current_sector_id = params[:sector_id]
      @user.scene_chapter = CyberGrowthState.scene_chapters[params[:scene_chapter].to_i]
      @user.save!
    end
  end
end
