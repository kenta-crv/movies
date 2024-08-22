class JobsController < ApplicationController
    def index
      @jobs = Job.order(created_at: "DESC").page(params[:page])
    end
  
    def show
      @job = Job.find(params[:id])
    end
  
    def new
      @job = Job.new
    end
  
    def create
      @job = Job.new(job_params)
      if @job.save
        JobMailer.received_email(@job).deliver_now # 管理者に通知
        JobMailer.send_email(@job).deliver_now # 送信者に通知
        redirect_to thanks_jobs_path # thanksページにリダイレクト
      else
        render 'new'
      end
    end
  
    def thanks
      # thanksページを表示するだけ
    end
  
  
    def edit
      @job = Job.find(params[:id])
    end
  
    def destroy
      @job = Job.find(params[:id])
      @job.destroy
       redirect_to jobs_path
    end
  
    def update
      @job = Job.find(params[:id])
      if @job.update(job_params)
        redirect_to jobs_path
      else
        render 'edit'
      end
    end
  
    private
    def job_params
      params.require(:job).permit(
        :name,
        :tel,
        :email,
        :birth,
        :gender,
        :city,
        :qualification,
        :period,
  
        :work_history,
  
        :area_hope,
        :course_hope,
  
        :quality_rank,

        :contact_tool,
        :interview,
  
        :remarks,
        )
    end
end
