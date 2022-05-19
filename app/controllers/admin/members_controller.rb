class Admin::MembersController < ApplicationController
   layout 'admin/application'

  def index
    @members = Member.page(params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to admin_member_path(@member)
    else
      render :edit
    end
  end

  private
  def member_params
     params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted, :postal_code, :address, :phone_number)
  end
end
