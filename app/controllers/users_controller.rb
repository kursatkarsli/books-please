class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @favs = Book.favourites(@user)
    @reads = Book.reading(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
