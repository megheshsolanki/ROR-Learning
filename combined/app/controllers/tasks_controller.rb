class TasksController < ApplicationController
    skip_before_action :authenticate_request
    def create
        @task = Task.new(task_params)
        if @task.save
            render json: @task, status: :created
        else
            render json: {errors: @task.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        @task = Task.find(params[:id])
        render json: @task, status: :ok
    end

    def get_all
        @tasks = Task.all
        render json: @tasks, status: :ok
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            render json: @task, status: :ok
        else
            render json: {errors: @task.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        render json: {message: "Task deleted", id: params[:id]}, status: :no_content
    end

    private 
        def task_params
            params.require(:task).permit(:title,:description)
        end
end
