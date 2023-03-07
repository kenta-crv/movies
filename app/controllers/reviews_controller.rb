class ReviewsController < ApplicationController
    before_action :load_company
    before_action :load_review, only: [:edit,:update,:show,:destroy]
    #before_action :authenticate_user!
  
    def load_company
      @company = Company.find(params[:company_id])
      @review = Review.new
    end
  
    def load_review
      @review = Review.find(params[:id])
    end
  
    def edit
    end
  
    def create
      @review = @company.reviews.new(review_params)
      if @review.save
        redirect_to company_path(@company)
      end
    end
  
    def destroy
      @company = Company.find(params[:company_id])
      @review = @company.reviews.find(params[:id])
      @review.destroy
      redirect_to company_path(@company)
    end
  
     def update
      @review = Review.find(params[:company_id])
      @review = @company.reviews.find(params[:id])
      if @review.update(review_params)
        redirect_to company_path(@company)
      else
        render 'edit'
      end
    end
  
    private
     def review_params
       params.require(:review).permit(
        :year,
        :body
      )
     end
  
  end
  