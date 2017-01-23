class RequestsController < ApplicationController
  before_action :init_request, except: [:index, :new, :create]
  before_action :init_dropdown, except: [:destroy, :update, :create]
  before_action :logged_in_user
  before_action :update_before_save, only: [:update, :create]

  def index
    get_requests
  end

  def new
    @request = Request.new
    respond_to do |format|
      format.js
    end
  end

  def create
    update_before_save
    respond_to do |format|
      if @request.save
        flash[:success] = t "action_message.create_success"
      else
        flash[:danger] = t "action_message.create_fail"
      end
      format.js
      render "requests/research"
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @request.update_attributes request_params
    respond_to do |format|
      format.js
      if @request.errors.empty?
        flash.now[:success] = t "action_message.update_success"
      else
        flash[:danger] = t "action_message.update_fail"
      end
      render "requests/research"
    end
  end

  def show
    @request.readonly = true
    respond_to do |format|
      format.js
    end
  end

  def destroy; end

  private

  def update_before_save
    @request = Request.new request_params unless @request
    unless @request.id
      @request.created_by = current_user.id
    end
    @request.updated_by = current_user.id
  end

  def request_params
    params.require(:request).permit :title, :description, :request_type_id,
      :request_status_id, :assignee_id
  end

  def get_requests
    @requests = Request.find_by_actor(params[:relative_id])
      .of_request_type(params[:request_type_id])
      .of_request_status(params[:request_status_id])
      .paginate page: params[:page]
  end

  def init_dropdown
    @request_statuses = RequestStatus.all
    @request_types = RequestType.all
    @staffs = User.all
  end

  def init_request
    @request = Request.find_by id: params[:id]
    unless @request
      flash[:danger] = t "request_manager.not_exist"
      redirect_to requests_path
    end
  end
end
