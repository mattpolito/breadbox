class PagesController < ApplicationController
  def home
    render :layout => "home"
  end
end