class UsersController < ApplicationController

  def index
    @users = User.all.order(:created_at)

    render({ :template => "users/all_users.html.erb"})
  end
  
  def show
    username = params.fetch("username")
    @user = User.where({ :username => username }).at(0)
    render({ :template => "users/user_details.html.erb"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("input_username")
    user.save
    
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    user_id = params.fetch("user_id")
    user = User.where({ :id => user_id }).at(0)
    
    user.username = params.fetch("input_username")
    user.save
    redirect_to("/users/#{user.username}")
  end

end
