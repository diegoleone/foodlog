class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @entries = @user.entries
  end

  # GET /users/new
  def new
    if logged_in?
      redirect_to entries_path
    else
      @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:token])
    if user
      user.email_confirmation # broke here - Cannot find the method
      user.save(validate: false) # Not necessary ?
      flash[:success] = "Welcome to the Foodlog App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @user.set_confirmation_token # WHY IS THIS LINE NOT NECESSARY ? WHERE IS THE TOKEN SET ?
        @user.save(validate: false) # might not need?
        UserMailer.with(user: @user).registration_confirmation.deliver_now
        format.html { redirect_to root_path, notice: "Please confirm your email address to continue" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :user_email, :password)
    end

end
