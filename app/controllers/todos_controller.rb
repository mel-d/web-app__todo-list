# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/todos/todos" do 
  @todos = Todo.all
  erb :"main/todos/todos"
end

MyApp.get "/todos/add" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    erb :"main/todos/add"
  else
    redirect "/logins/new_login"
  end
end

MyApp.post "/todos/added_todo" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    @current_user = User.find_by_email(params[:email])
    @todo = Todo.new
    @todo.title = params[:title]
    @todo.description = params[:description]
    @todo.completed = false
    @todo.user_id = @current_user.id
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
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    @todo = Todo.find_by_id(params[:id])
    erb :"main/todos/edit"
  else
    redirect "/logins/new_login"
  end
end

MyApp.post "/todos/edited_todo/:id" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    @todo = Todo.find_by_id(params[:id])
    @todo.title = params[:title]
    @todo.description = params[:description]
    @todo.completed = params[:completed]
    @todo.save
    redirect "/todos/view_description/#{@todo.id}"
  else
    redirect "/logins/new_login"
  end
end

MyApp.get "/todos/delete/:id" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
    @todo = Todo.find_by_id(params[:id])
    @todo.delete
    erb :"main/todos/deleted"
  else
    redirect "/logins/new_login"
  end
end