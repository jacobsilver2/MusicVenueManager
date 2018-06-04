class ActsController < ApplicationController
  before_action :find_act, only:[:show, :edit, :update, :destroy]
  before_action :find_show, only:[:index]

  def index
    @show = Show.find(params[:show_id])
  end

  def show
  end  

  def new
    show = Show.find(params[:show_id])
    @act = show.acts.create
    render partial: 'form', locals: { act: @act, show_id: show }, layout: false
  end


  def create 
  act = Act.new(act_params)
    
    respond_to do |format|
      if act.save
        set_set_order(act, act.shows.first)
        render json: act, status: 201
        # format.html { redirect_to show_path(@act.shows.first), notice: 'Act was successfully added.' }
      else
        @show = Show.last
        format.html {redirect_to show_path(@show), notice: 'Errors were found.' }
      end
    end
  end
  
  def edit 
  end
  
  def update
    respond_to do |format|
      if @act.update(act_params)
        
        format.html { redirect_to act_path(@act), notice: 'Act was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
    ActShow.where("act_id = ?", @act.id).destroy_all
    @act.destroy
    respond_to do |format|
      format.html {redirect_to shows_path, notice: 'Act was successfully deleted. '}
    end
  end
  
  private
  
  def find_act
    @act = Act.find(params[:id])
  end
  
  def find_show
    @show = Show.find(params[:show_id])
  end

  def act_params
    params.require(:act).permit(:name, :website, :blurb, :contact_name, :contact_email, :notes, :collectionName, act_shows_attributes: [:headliner, :show_id])
  end

  def set_set_order(act, show)
     # get the specific line on ActShow
     actshow = ActShow.where("act_id = ? and show_id = ?", act.id, show.id).first
     # get all the acts of that specific show
     showInstances = ActShow.where("show_id = ?", show.id)
     if showInstances.count == 1
       actshow.set_order = 1
     else
       # get the highest value in set_order (stripping the newly added nil value and add the value plus one to actshow)
       actshow.set_order = (showInstances.map{|show| show.set_order}.reject{|item| item.nil?}.max) + 1
     end
     actshow.save
  end


end


