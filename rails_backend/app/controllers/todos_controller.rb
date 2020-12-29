# app/controllers/todos_controller.rb
class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]
    before_action :check_authorised, only: [:destroy, :show, :update] 
    #ensure that the todo they are destroying, showing or updating is theirs

    # GET /todos
    def index
      @todos = @user.todos
      @with_categories = @todos.map{|curr| {todo: curr, categories: curr.categories}}
      json_response(@with_categories)
    end
        
    # POST /todos
    def create
      todo_create = todo_params
      #converts the string to array by splitting by spaces
      todo_create[:category_ids] = todo_create[:category_ids] && todo_create[:category_ids].split(" ")
      #adding the user_id
      todo_create[:user_id] = @user.id
      @todo = Todo.create!(todo_create) #the model will auto convert strings into their respective types
      json_response(@todo, :created)
    end
  
    # GET /todos/:id
    def show
      @categories = @todo.categories
      json_response({todo: @todo, categories: @categories})
    end
  
    # PUT /todos/:id
    def update
      todo_create = todo_params
      #converts the string to array by splitting by spaces
      todo_create[:category_ids] = todo_create[:category_ids] && todo_create[:category_ids].split(" ")
      #adding the user_id
      todo_create[:user_id] = @user.id
      @todo.update(todo_create)
      head :no_content
    end
  
    # DELETE /todos/:id
    def destroy
      @todo.destroy
      head :no_content
    end

    def destroycompleted
      @user.todos.where(:completed => true).destroy_all
      head :no_content
    end
    private
  
    def todo_params
      # whitelist params #properties tied directly to params, not within an object
      params.permit(:title, :description, :created_at, :due_by, :completed, :important, :category_ids)
    end
  
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def check_authorised #ensure that the todo they are destroying, showing or updating is theirs
      json_response({ message: "Unauthorised."}, :unauthorized) if @user.id != @todo.user_id
    end
  end