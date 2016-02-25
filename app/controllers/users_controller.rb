# This controller is for all the CRUD operations related to a User.

MyApp.get "/" do
  erb :"main/welcome"
end

MyApp.before "/users/update*" do
  @current_user = User.find_by_id(session[:user_id])
  if @current_user == nil
    redirect "/logins/new_login"
  end
end

MyApp.before "/users/delete*" do
  @current_user = User.find_by_id(session[:user_id])
  if @current_user == nil
    redirect "/logins/new_login"
  end
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
  redirect "/todos/todos"
end

MyApp.get "/users/update_user/:id" do
  @user = User.find_by_id(params[:id])
  erb :"main/users/update_user"
end

MyApp.post "/users/updated_user/:id" do
  @user = User.find_by_id(params[:id])
  @user.name = params[:human]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.save
  redirect "/users/users"
end

MyApp.get "/users/delete_user/:id" do
  @user = User.find_by_id(params[:id])
  @user.delete
  redirect "/users/users"    
end

MyApp.get "/users/users" do
  @users = User.all
  erb :"main/users/users"
end