class ShowsController < ApplicationController
  before_action :find_show, only:[:show, :edit, :update, :destroy]

  def index
    @shows = Show.all
  end
  
  def show  
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
      else
        
        format.html {render :new, notice: 'errors, bitch.' }
      end
    end
  end

  def update
  end

  private
  def find_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(:date, :start_time, :confirmed, :user_id, :act_id, :notes)
  end


end
