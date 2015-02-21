class Api::MinagoraSwitch::MasterDataController < Api::BaseController
  skip_before_filter :authentication
  def index
    @mst_gimmicks = Mst::Gimmick.all
    @mst_stages = Mst::Stage.all
    @mst_stage_gimmicks = Mst::StageGimmick
  end
end
