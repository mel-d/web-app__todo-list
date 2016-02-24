# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/todos/todos" do 
  @todos = Todo.all
  erb :"main/todos/todos"
end

MyApp.get "/todos/add" do
  erb :"main/todos/add"
end

MyApp.post "/todos/added_todo" do
  @current_user = User.find_by_email(params[:email])
  @todo = Todo.new
  @todo.title = params[:title]
  @todo.description = params[:description]
  @todo.completed = false
  @todo.user_id = @current_user.id
  @todo.save
  erb :"main/todos/added_todo"
end

MyApp.get "/todos/view_description/:id" do
  @todo = Todo.find_by_id(params[:id])
  erb :"main/todos/view_description"
end

MyApp.get "/todos/edit/:id" do
  @todo = Todo.find_by_id(params[:id])
  erb :"main/todos/edit"
end

MyApp.post "/todos/edited_todo/:id" do
  @todo = Todo.find_by_id(params[:id])
  @todo.title = params[:title]
  @todo.description = params[:description]
  @todo.completed = params[:completed]
  @todo.save
  erb :"main/todos/edited_todo"
end

MyApp.get "/todos/delete/:id" do
  @todo = Todo.find_by_id(params[:id])
  @todo.delete
  erb :"main/todos/deleted"
end