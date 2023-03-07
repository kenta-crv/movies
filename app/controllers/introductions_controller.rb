class IntroductionsController < ApplicationController
  before_action :load_company
  before_action :load_introduction, only: [:edit,:update,:show,:destroy]
  #before_action :authenticate_user!

  def load_company
    @company = Company.find(params[:company_id])
    @introduction = Introduction.new
  end

  def load_introduction
    @introduction = Introduction.find(params[:id])
  end

  def edit
  end

  def create
    @introduction = @company.introductions.new(introduction_params)
    if @introduction.save
      redirect_to company_path(@company)
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @introduction = @company.introductions.find(params[:id])
    @introduction.destroy
    redirect_to company_path(@company)
  end

   def update
    @introduction = Introduction.find(params[:company_id])
    @introduction = @company.introductions.find(params[:id])
    if @introduction.update(introduction_params)
      redirect_to company_path(@company)
    else
      render 'edit'
    end
  end

  private
   def introduction_params
     params.require(:introduction).permit(
      :body
    )
   end

end
