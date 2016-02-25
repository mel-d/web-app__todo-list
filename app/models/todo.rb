class Todo < ActiveRecord::Base

  def get_category
    @todo_object = Todo.find_by_id(self.id)
    @category_id = @todo_object.category_id
    @category_object = Category.find_by_id(@category_id)
    return @category_object.name
  end

end