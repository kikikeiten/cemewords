class CemewordsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

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
    @cemeword.destroy
    flash[:success] = 'The message has been deleted.'
    redirect_back(fallback_location: root_path)
  end

  private

  def cemeword_params
    params.require(:cemeword).permit(:content)
  end

  def correct_user
    @cemeword = current_user.cemewords.find_by(id: params[:id])
    unless @cemeword
      redirect_to root_url
    end
  end
end
