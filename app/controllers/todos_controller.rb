class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]
  before_action :set_todo, only: [:move_lower, :move_higher]

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    if @todo.save
      ajax_response
    else 
      render 'pages/home'
    end
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(done: params.dig(:todo, :done))
    ajax_response
  end

  def move_higher
    @todo.move_higher
    ajax_response
  end

  def move_lower
    @todo.move_lower
    ajax_response
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :due_date)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def ajax_response
    respond_to { |format| format.js }
  end
end
