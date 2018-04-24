class ActsController < ApplicationController
  before_action :find_act, only:[:show, :edit, :update, :destroy]
  before_action :find_show, only:[:index,:new, :edit, :update]

  def index
    @show = Show.find(params[:show_id])
  end

  def new
    @act = Act.new
  end
  
  def create 
    if params[:act][:collectionName] != ""
      @act = Act.find(params[:act][:collectionName])
      set_set_order(@act, @act.shows.last)
      redirect_to show_path(@act.shows.last)
      return
    else
      @act = Act.new(act_params)
    end
    
    respond_to do |format|
      if @act.save
        set_set_order(@act, @act.shows.last)
        format.html { redirect_to show_path(@act.shows.last), notice: 'Act was successfully added.' }
      else
        format.html {render :new, notice: 'Errors were found.' }
      end
    end
  end
  
  def edit 
  end
  
  def update
    raise params.inspect
    respond_to do |format|
      if @act.update(act_params)
        format.html { redirect_to show_act_path(@act), notice: 'Act was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
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


