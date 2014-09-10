class StaticPagesController < ApplicationController
  def home
  end

  def welcome
    @controller_content = "This is coming from the controller"
  end
end
