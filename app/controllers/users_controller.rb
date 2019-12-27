class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  #curl -H 'Authorization: OAuth Az3dus6YomWylDkiYTMH86AiSBYr3zgSf4um9b6B0bZGDAaXgfE9FIZb6xu7Znq8iVAB6xrto-VGoSeGZUSfkmqduJCo5tju57tl3LpdxqIwYAH8NW3pp3SZpX5J6Xh10QMGy0hxcYKsLEE1p8Me4XaKlnJr6tDpTsGQ0xCx_obNKzlacwodzHaXKW4i9ksIwynuaZjhKFp9dAFq4mbOn0ghUTNRiytl7PEX9l7GTVvrOAWNnUQ7SzPfWdNe:feedlydev' https://cloud.feedly.com/v3/profile
  #curl -X POST -H "Content-Type: application/json" http://cloud.feedly.com/v3/profile ...
  #curl -H 'Content-Type:application/json' http://localhost:3000/users -X POST -d '{"user": {"username" :"Codi"} }'

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username)
    end
end
