class TodosController < ApplicationController
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      respond_to { |format| format.js }
    else 
      render 'pages/home'
    end
  end

  def update
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :due_date)
  end
end
