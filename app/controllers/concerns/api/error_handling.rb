# coding: utf-8
module Api::ErrorHandling
  extend ActiveSupport::Concern

  included do
    # サーバー側が想定していない動作が発生した場合に返すエラー
    rescue_from StandardError do |e|
      render_json(status: 500, exception: e)
    end
  end

  private def render_json(status:, exception:)
    logger.error exception.class.name
    logger.error exception.to_s if exception.to_s

    if Rails.env.test? && ENV["DEBUG"].present?
      raise exception
    end

    if Rails.env.development? || Rails.env.test?
      trace = exception.backtrace.select{ |t| t =~ /^#{Rails.root}/ } # 自分か作った部分が悪い
      trace = exception.backtrace if trace.empty?                     # Gemが悪い
      trace = trace.map {|t| t.gsub(/^#{Rails.root}/, '') }
      trace_string = trace.join("\n")

      logger.error trace_string
      render status: status, json: {
        error: {
          url: request.url,
          parameters: request.request_parameters.to_s,
          message: exception.to_s,
          trace: trace_string,
        }
      }.to_json
    else
      logger.error exception.backtrace.join("\n")
      render status: status, nothing: true
    end
  end
end
