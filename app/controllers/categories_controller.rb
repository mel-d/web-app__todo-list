MyApp.get "/categories/add" do
  erb :"main/categories/add"
end

MyApp.post "/categories/added" do
  @category = Category.new
  @category.name = params[:category]
  @category.save
  redirect "/todos/todos"
end

MyApp.get "/categories/edit/:id" do
  @category = Category.find_by_id(params[:id])
  erb :"main/categories/edit"
end

MyApp.post "/categories/edited/:id" do
  @category = Category.find_by_id(params[:id])
  @category.name = params[:category]
  @category.save
  redirect "/categories/view"
end

MyApp.get "/categories/view" do
  @categories = Category.all
  erb :"main/categories/view"
end

MyApp.get "/categories/delete/:id" do
  @category = Category.find_by_id(params[:id])
  @category.delete
  redirect "/categories/view"
end