class JobsController < ApplicationController
    before_action :authenticate_admin!, except: [:show]
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
        redirect_to jobs_path
      else
        render 'new'
      end
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
        :prefecture,
        :city,
        :birth,
        :gender,
        :age,
        :hire_date_1,
        :retirement_date_1,
        :content_1,
        :hire_date_2,
        :retirement_date_2,
        :content_2,
        :hire_date_3,
        :retirement_date_3,
        :content_3,
        :requirements,
        :appeal,
        :desired,
        :remarks,
        )
    end
end
