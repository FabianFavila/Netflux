class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]
  before_action :set_movie, except: [:index]
  before_action :authenticate_user!

  # GET /rents
  # GET /rents.json
  def index
    @rents = Rent.where(user_id: current_user.id).order("created_at DESC")
  end

  # GET /rents/1
  # GET /rents/1.json
  def show
    @rents = Rent.where(user_id: current_user.id).order("created_at DESC")
  end

  # GET /rents/new
  def new
    @rent = Rent.new()
    @rent.user_id = current_user.id
    @rent.movie_id = @movie.id
    @rent.start = Time.now
    @rent.end = Time.now + 5.days

    if @rent.save
      @movie.stock = @movie.stock - 1
      @movie.save
      flash[:success] = "Tu renta fue creada exitosamente"
      redirect_to root_path
    else
      flash[:alert] = "Hubo un problema al crear tu renta."
      redirect_to root_path
    end
  end

  # POST /rents
  # POST /rents.json
  def create
    @rent = Rent.new(rent_params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_params
      params.require(:rent).permit(:start, :end)
    end
end
