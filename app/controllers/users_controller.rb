# This controller is for all the CRUD operations related to a User.

MyApp.get "/" do
  erb :"main/welcome"
end

MyApp.get "/users/create_user" do
  erb :"main/users/create_user"
end

MyApp.post "/users/user_created" do
  @user = User.new
  @user.name = params[:human]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.save
  erb :"main/users/user_created"
end

MyApp.get "/users/update_user" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    erb :"main/users/update_user"
  else
    erb :"main/users/login_first"
  end
end

MyApp.post "/users/user_updated" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    @current_user.name = params[:human]
    @current_user.email = params[:email]
    @current_user.password = params[:password]
    @current_user.save
    erb :"main/users/user_updated"
  else
    erb :"main/users/login_first"
  end
end

MyApp.get "/users/delete_user" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    erb :"main/users/delete_user"    
  else
    erb :"main/users/login_first"
  end
end

MyApp.post "/users/user_deleted" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    @current_user.name = params[:human]
    @current_user.email = params[:email]
    @current_user.password = params[:password]
    @current_user.delete
    erb :"main/users/user_deleted"
  else
    erb :"main/users/login_first"
  end
end

MyApp.get "/users/users" do
  @users = User.all
  erb :"main/users/users"
end