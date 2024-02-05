class StaticPagesController < ApplicationController
  
  def home
    Rails.logger.info("hello, world")
  end

  def help
  end

  def about
  end
end