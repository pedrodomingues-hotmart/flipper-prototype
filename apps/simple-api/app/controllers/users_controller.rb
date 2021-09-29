class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params["id"])

    return render_not_found if @user.nil?    
  end

  private
    def render_not_found
      render json: '', status: :not_found
    end
end