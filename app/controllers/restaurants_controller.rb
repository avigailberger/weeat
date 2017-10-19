class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  #@default_serializer = RestaurantSerializer

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @notice = params['notice']
    @cuisines = Cuisine.all
  end

  # GET /restaurants/1/edit
  def edit
    @cuisines = Cuisine.all
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    begin
      @restaurant = Restaurant.new(restaurant_params)
      @cuisine = @restaurant.cuisine
      if @cuisine.nil?
        error_saving('Error in saving Restaurant: invalid cuisine')
        return
      end
      respond_to do |format|
        if @restaurant.save
          format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
          format.json { render :show, status: :created, location: @restaurant }
        else
          error_saving('Error in saving Restaurant: invalid params')
          return
        end
      end
    rescue => e
      error_saving ('Error in saving Restaurant: missing data. exception: ' + e.to_s)
      return
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        @cuisines = Cuisine.all
        format.html { render :edit}
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:restaurant_name, :address, :is_ten_bis, :cuisine_id, :lng, :lat)
    end

  def error_saving (notice)
    logger.error notice
    @cuisines = Cuisine.all
    respond_to do |format|
      format.html { redirect_to action: :new, notice: notice }
      format.json { head :no_content}
    end
  end

end
