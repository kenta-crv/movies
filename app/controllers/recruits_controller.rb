class RecruitsController < ApplicationController
    before_action :load_company
    before_action :load_recruit, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @recruit = Recruit.new
    end
  
    def load_recruit
      @recruit = Recruit.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @recruit = @company.recruits.new(recruit_params)
      if @recruit.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @recruit = @company.recruits.find(params[:id])
      @recruit.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @recruit = Recruit.find(params[:company_id])
      @recruit = @company.recruits.find(params[:id])
      if @recruit.update(recruit_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def recruit_params
       params.require(:recruit).permit(
        :year,
        :salary, #給与
        :occupation, #募集職種
        :employment_status, #雇用形態
        :body, #求人内容
        :sales_point #セールスポイント
      )
     end
  
  end
  