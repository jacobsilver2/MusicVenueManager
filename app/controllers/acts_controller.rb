class ActsController < ApplicationController
  before_action :find_act, only:[:show, :edit, :update, :destroy]

  def new
    @act = Act.new
    @show = Show.find(params[:show_id])

  end

  def create  
    raise params.inspect
    @act = Act.new(act_params)
    @show = Show.find(params[:act][:show_id])
    respond_to do |format|
      if @act.save
        @show.acts << @act
        format.html { redirect_to show_path(@show), notice: 'Act was successfully added.' }
      else
        format.html {render :new, notice: 'Errors were found.' }
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

  def act_params
    params.require(:act).permit(:name, :website, :blurb, :contact_name, :contact_email, :notes)
  end


end


