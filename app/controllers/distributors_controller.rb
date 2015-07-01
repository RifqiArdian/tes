class DistributorsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user
  before_filter :authenticate_admin, except: [:index, :show, :edit, :update]
  before_filter :not_current_user, only: [:edit, :update]
  def index
    @distributors = Distributor.all
  end

  def show
    @distributor = Distributor.find(params[:id])
  end

  def new
    @distributor = Distributor.new
  end

  def edit
    @distributor = Distributor.find(params[:id])
  end

  def create
    @distributor = Distributor.new(distributor_params)
      if @distributor.save
        redirect_to distributors_path
      else
        redirect_to new_distributor_path
      end
  end

  def update
    @distributor = Distributor.find(params[:id])
    @distributor.update(distributor_params)
    redirect_to distributors_path
  end

  def destroy
    @distributor = Distributor.find(params[:id])
    @distributor.destroy
    redirect_to distributors_path
  end

  private
    def distributor_params
      params.require(:distributor).permit(:distributor_id, :distributor_name, :address, :phone1, :phone2, :email, :fax)
    end
end


