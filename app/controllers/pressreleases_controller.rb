class PressreleasesController < ApplicationController
    before_action :load_company
    before_action :load_pressrelease, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @pressrelease = Pressrelease.new
    end
  
    def load_pressrelease
      @pressrelease = Pressrelease.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @pressrelease = @company.pressreleases.new(pressrelease_params)
      if @pressrelease.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @pressrelease = @company.pressreleases.find(params[:id])
      @pressrelease.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @pressrelease = Pressrelease.find(params[:company_id])
      @pressrelease = @company.pressreleases.find(params[:id])
      if @pressrelease.update(pressrelease_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def pressrelease_params
       params.require(:pressrelease).permit(
        :year,
        :body
      )
     end
  
  end
  