# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.

MyApp.get "/logins/new_login" do
  erb :"main/logins/new_login"
end

MyApp.post "/logins/create_login" do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session["user_id"] = @user.id
    redirect "/todos/todos"
  else
    redirect "/logins/new_login"
  end
end

MyApp.get "/logins/delete_login" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    session["user_id"] = nil
    redirect "/"
  else
    erb :"main/logins/already_logged_out"
  end
end