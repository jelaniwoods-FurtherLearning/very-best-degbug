class UsersController < ApplicationController

  def index
    @users = User.all.order(:created_at)

    render({ :template => "users/all_users.html.erb"})
  end
  
  def show
    username = params.fetch("username")

    render({ :template => "users/user_details.html.erb"})
  end

  def create

    redirect_to("users/#{user.username}")
  end

  def update

    redirect_to("users/#{user.username}")
  end

end
