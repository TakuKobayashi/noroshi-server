# coding: utf-8
class ApplicationController < ActionController::Base
  require "addressable/uri"

  protect_from_forgery with: :exception
end
