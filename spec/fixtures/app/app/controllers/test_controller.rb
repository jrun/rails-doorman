class TestController < ApplicationController
  def show; render(:text => 'Allowed Access') end
  def index; render(:text => 'Allowed Access') end
end
