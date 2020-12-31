class CemewordsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @cemeword = current_user.cemewords.build(cemeword_params)
    if @cemeword.save
      flash[:success] = 'You posted a message.'
      redirect_to root_url
    else
      @cemewords = current_user.cemewords.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'Failed to post your message.'
      render 'toppages/index'
    end
  end

  def destroy
  end

  private

  def cemeword_params
    params.require(:cemeword).permit(:content)
  end
end
