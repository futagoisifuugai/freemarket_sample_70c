class UserAdressesController < ApplicationController

  def index
    @nickname = current_user.nickname
  end
  
  def new
    @user_adress = UserAdress.new
  end

  def create
    @user_adress = UserAdress.new(user_adress_params)

    if @user_adress.save
      redirect_to user_adresses_path
    else
      render :new
    end
  end


  private
  def user_adress_params
    params.require(:user_adress).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:prefectures,:city,:city_adress,:building,:phone_number,:postal_code).merge(user_id: current_user.id)
  end


end
