class ShowsController < ApplicationController
  before_action :find_show, only:[:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @shows = Show.shows_by_date
      render json: @shows
    else
      @shows = Show.confirmed_shows_by_date
      render json: @shows
    end
  end
  
  def show
    render json: @show
  end

  def today
    if user_signed_in?
      @show = Show.today_all.first
      
    else
      @show = Show.today_confirmed
    end
  end

  def this_week
    if user_signed_in?
      @shows = Show.this_week_all
    else
      @shows = Show.this_week_confirmed
    end
  end

  def new
    @show = Show.new
    render partial: 'form', locals: { show: @show }, layout: false 
  end

  def create
    params[:show].parse_time_select! :start_time
    show = Show.new(show_params)
    show.user_id = current_user.id if current_user
    if show.save
      render json: show, status: 201
        # format.html { redirect_to show_path(@show), notice: 'Show was successfully created.' }
    else
        format.html {render :new, notice: 'Errors were found.' }
    end
  end

  def edit
  end

  def update
    params[:show].parse_time_select! :start_time
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @show.destroy
    ActShow.where(:show_id => @show.id).destroy_all
    respond_to do |format|
      format.html { redirect_to shows_path , notice: 'Show was successfully deleted.' }
    end
  end

  private

  def find_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.require(:show).permit(:date, :start_time, :confirmed, :user_id, :act_id, :notes)
  end


end
