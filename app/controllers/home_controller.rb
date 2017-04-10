class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.owner?
      @customers = User.where(:user_type => 2)
    end
  end

  def profile
    if user_signed_in? && current_user.customer?
      @customer = User.find(current_user)
    else
      @customers = User.where(:user_type => 2)
    end
  end

end
