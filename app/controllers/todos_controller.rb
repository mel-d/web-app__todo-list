# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/todos/todos" do 
  @todos = Todo.all
  erb :"main/todos/todos"
end

MyApp.get "/todos/add" do
  erb :"main/todos/add"
end

MyApp.post "/todos/added_todo" do
  @todo = Todo.new
  @todo.title = params[:title]
  @todo.description = params[:description]
  @todo.completed = false
  @user_object = User.find_by_id(session["user_id"])
  binding.pry
  @todo.user_id = @user_object.id
  @todo.save
  erb :"main/todos/added_todo"
end

MyApp.get "/todos/edit" do
  erb :"main/todos/edit"
end

MyApp.post "/todos/edited_todo" do
  erb :"main/todos/edited_todo"
end