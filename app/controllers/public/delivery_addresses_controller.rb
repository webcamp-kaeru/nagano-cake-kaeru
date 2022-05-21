class Public::DeliveryAddressesController < ApplicationController
  layout 'public/application'

  def index
    @delivery_address = DeliveryAddress.new
    @delivery_addresses = current_member.delivery_addresses
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.member_id = current_member.id
    if @delivery_address.save
      flash[:notice] = "配送先を登録しました"
      redirect_back fallback_location: root_path
    else
      flash[:notice] = '配送先の登録に失敗しました'
      render :index
    end
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.update(delivery_address_params)
      flash[:notice] = "配送先を編集しました"
      redirect_to delivery_addresses_path
    else
      flash[:notice] = '配送先の編集に失敗しました'
      render :index
    end
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.destroy
      flash[:notice] = "配送先を削除しました"
      redirect_back fallback_location: root_path
    else
      flash.now[:alert] = '配送先の削除に失敗しました'
      render :index
    end
  end

  private

  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :address, :shipping_name)
  end
end
