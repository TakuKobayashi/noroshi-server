# coding: utf-8
class Api::Sns::TwitterController < Api::Sns::BaseController
  def tweet
    options = {}
    options.merge!(lat: params[:lat].to_f, long: params[:long].to_f) if params[:lat].present? && params[:long].present?
    @sns.tweet!(params[:tweet], options)
    head(:ok)
  end
end
