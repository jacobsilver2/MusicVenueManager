class ShowsController < ApplicationController
  before_action :find_show, only:[:show, :edit, :update, :destroy]

  def index
    @shows = Show.all
  end
  
  def show  
  end

  def new
    @show = Show.new
    @user = current_user
    
  end

  def create
    @show = Show.new(show_params)
    @show.user_id = current_user.id if current_user
    respond_to do |format|
      if @show.save
        format.html { redirect_to show_path(@show), message: 'Show was successfully created.' }
      else
        format.html {render :new, message: 'errors, bitch.' }
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
