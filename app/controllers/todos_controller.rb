class TodosController < ApplicationController
  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save!
      respond_to { |format| format.js }
    else 
      render 'pages/home'
    end
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(done: params.dig(:todo, :done))
    respond_to { |format| format.js }
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :due_date)
  end
end