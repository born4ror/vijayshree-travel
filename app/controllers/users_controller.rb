class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :profile]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def profile
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
