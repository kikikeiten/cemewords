class ToppagesController < ApplicationController
  def index
    if logged_in?
      @cemeword = current_user.cemewords.build # form_with 用
      @cemewords = current_user.cemewords.order(id: :desc).page(params[:page])
    end
  end
end
