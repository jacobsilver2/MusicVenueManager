class ActsController < ApplicationController
  before_action :find_act, only:[:show, :edit, :update, :destroy]

  def new
  end

  private

  def find_act
    @act = Act.find(params[:id])
  end

end
