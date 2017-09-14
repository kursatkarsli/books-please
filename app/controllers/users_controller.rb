class UsersController < ApplicationController

  def index
    @users = [
      User.new(name: 'Zosia', avatar_img: 'zosia.jpg'),
      User.new(name: 'Marysia', avatar_img: 'marysia.jpg'),
      User.new(name: 'Jasiu', avatar_img: 'jasiu.jpg'),
      User.new(name: 'Michał', avatar_img: 'michal.jpg')
    ]
  end

end
