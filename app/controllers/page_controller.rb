class PageController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def faq
  end

  def show
    @user = current_user
  end
end
