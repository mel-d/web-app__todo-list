# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/todos/todos" do 
  @todos = Todo.all
  erb :"main/todos/todos"
end

MyApp.get "/todos/add" do
  @categories = Category.all
  @users = User.all
  @current_user = User.find_by_id(session[:user_id])
  if @current_user != nil
    erb :"main/todos/add"
  else
    redirect "/logins/new_login"
  end
end

MyApp.post "/todos/added_todo" do
  @categories = Category.all
  @users = User.all
  @current_user = User.find_by_id(session[:user_id])
  if @current_user != nil
    @todo = Todo.new
    @todo.title = params[:title]
    @todo.description = params[:description]
    @todo.category_id = params[:category]
    @todo.completed = false
    @todo.created_by_id = @current_user.id
    @todo.user_id = params[:designated]
    @todo.save
    redirect "/todos/todos"
  else
    redirect "/logins/new_login"
  end
end

MyApp.get "/todos/view_description/:id" do
  @todo = Todo.find_by_id(params[:id])
  erb :"main/todos/view_description"
end

MyApp.get "/todos/edit/:id" do
  @categories = Category.all
  @users = User.all
  @current_user = User.find_by_id(session[:user_id])
  if @current_user != nil
    @todo = Todo.find_by_id(params[:id])
    erb :"main/todos/edit"
  else
    redirect "/logins/new_login"
  end
end

MyApp.post "/todos/edited_todo/:id" do
  @current_user = User.find_by_id(session[:user_id])
  if @current_user != nil
    @todo = Todo.find_by_id(params[:id])
    @todo.title = params[:title]
    @todo.description = params[:description]
    @todo.category_id = params[:category]
    @todo.completed = params[:completed]
    @todo.save
    redirect "/todos/todos"
  else
    redirect "/logins/new_login"
  end
end

MyApp.get "/todos/delete/:id" do
  @current_user = User.find_by_id(session[:user_id])
  if @current_user != nil
    @todo = Todo.find_by_id(params[:id])
    @todo.delete
    redirect "/todos/todos"
  else
    redirect "/logins/new_login"
  end
end