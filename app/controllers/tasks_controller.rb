class TasksController < ApplicationController
    before_action :current_user ,only:[:index]
    before_action :require_user_logged_in
    before_action :correct_user ,only:[:show,:edit,:update,:destroy]
    
    
    def index
        @tasks = current_user.tasks.order(id: :desc)
        counts(@current_user)
    end
    def create
        @task=current_user.tasks.build(task_params)
        if @task.save
            flash[:success] ='Taskが正常に追加されました'
            redirect_to @task
        else
            flash.now[:danger]='Taskが追加されませんでした'
            render :new
        end
            
    end
    def new
        @task=Task.new
    end
    def update
        if @task.update(task_params)
             flash[:success] = 'Task は正常に更新されました'
             redirect_to @task
        else
             flash.now[:danger] = 'Task は更新されませんでした'
            render :edit
        end    
    end
    def destroy
        @task.destroy
        
        flash[:success]='Taskは正常に削除されました'
        redirect_to tasks_url
    end
    private
    def task_params
        params.require(:task).permit(:content,:status)
    end
    def correct_user
        @task = current_user.tasks.find_by(id: params[:id])
        unless @task
            flash[:danger]='権限がありません'
            redirect_to root_url
        end
    end
end
