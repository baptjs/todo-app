class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]
  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save
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

  def move_higher
    @todo = Todo.find(params[:todo_id])
    @todo.move_higher
    # render 'pages/home'
    respond_to { |format| format.js }
  end

  def move_lower
    @todo = Todo.find(params[:todo_id])
    @todo.move_lower
    # render 'pages/home'
    respond_to { |format| format.js }
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :due_date)
  end
end
