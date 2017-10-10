class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  #rescue_from ActiveRecord::RecordNotFound, with: :invalid_restaurant

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @restaurants = Restaurant.all
  end

  # GET /reviews/1/edit
  def edit
    @restaurants = Restaurant.all
  end

  # POST /reviews
  # POST /reviews.json
  def create
    begin
      @review = Review.new(review_params)
      @restaurant = @review.restaurant
      if @restaurant.nil?
        error_saving('Error in saving Review: invalid restaurant id: ' + @review.restaurant_id.to_s)
        return
      end
      if @review.save
        respond_to do |format|
          format.html { redirect_to @review, notice: 'Review was successfully created.' }
          format.json { render :show, status: :created, location: @review }
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @review.errors, status: :unprocessable_entity }
          end
      end

    rescue => e
      error_saving ('Error is saving Review: missing data. exception: ' + e.to_s)
      return
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to xsshare common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:user_name, :remark, :rating, :restaurant_id)
    end

    def error_saving (notice)
      logger.error notice
      @reviews = Review.all
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: notice }
        format.json { head :no_content }
      end
    end
end
