class ApplicationController < ActionController::Base
    
    include SessionsHelper
    private

    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    def non_completed_counts(tasks)
        @count_tasks=tasks.where.not(status: '完了').count
    end
    
    def completed_counts(tasks)
        @task_num=tasks.where(status: '完了').count
    end
    
end
