class ApplicationController < ActionController::Base
    
    include SessionsHelper
    private

    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    def counts(user)
        @count_tasks=user.tasks.count
    end
    
    def count_tasks(tasks)
        @task_num=0
        tasks.each do |f|
            @task_num+=1
        end
    end
    
end
