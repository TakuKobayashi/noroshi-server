class Api::CyberGrowth::MasterDataController < Api::BaseController
  skip_before_filter :authentication

  def index
    @mst_sectors = Mst::Sector.all
  end
end
