class Public::MembersController < ApplicationController
  layout 'public/application'

  def show
  end

  def edit
    @member = current_member
  end

  def update
     @member = current_member
     if @member.update(member_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to members_my_page_path
     else
        render :edit
     end
  end

  def unsubscribe
  end

  def withdraw
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :is_deleted, :postal_code, :address, :phone_number)
  end

end
