class Users::ListsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /users/lists
  # GET /users/lists.xml
  def index
    @lists = current_user.lists
    respond_with(@lists)
  end

  # GET /users/lists/1
  # GET /users/lists/1.xml
  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  # GET /users/lists/new
  # GET /users/lists/new.xml
  def new
    @list = List.new
    4.times { @list.tasks.build }
    respond_with(@list)
  end

  # GET /users/lists/1/edit
  def edit
    @list = current_user.lists.find(params[:id])
  end

  # POST /users/lists
  # POST /users/lists.xml
  def create
    @list = current_user.lists.build(params[:list])
    if @list.save
      respond_with(@list, :location => users_list_url(@list.id))
    else
      respond_with(@list, :location => new_users_list_url)
    end
  end

  # PUT /users/lists/1
  # PUT /users/lists/1.xml
  def update
    @list = current_user.lists.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with(@list, :location => users_list_url(@list))
  end

  # DELETE /users/lists/1
  # DELETE /users/lists/1.xml
  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    respond_with(@list, :location => users_lists_url)
  end
end
