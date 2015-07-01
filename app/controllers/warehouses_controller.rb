class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
      if @warehouse.save
        redirect_to warehouses_path
      else
        redirect_to new_warehouse_path
      end
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    @warehouse.update(warehouse_params)
    redirect_to warehouses_path
  end

  def destroy
    @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy
    redirect_to warehouses_path
  end

  private
    def warehouse_params
      params.require(:warehouse).permit(:warehouse_id, :warehouse_name, :address, :phone, :code, :distributor_id)
    end
end
