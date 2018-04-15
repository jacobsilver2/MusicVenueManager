class ActsController < ApplicationController
  before_action :find_act, only:[:show, :edit, :update, :destroy]

  def new
    binding.pry
    @act = Act.new
  end

  def create
    @act = Act.new(act_params)
    binding.pry
    # @act.user_id = current_user.id if current_user
    respond_to do |format|
      if @act.save
        format.html { redirect_to show_path(@show), notice: 'Act was successfully added.' }
      else
        format.html {render :new, notice: 'Errors were found.' }
      end
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


