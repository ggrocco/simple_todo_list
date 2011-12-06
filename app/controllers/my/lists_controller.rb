class My::ListsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /my/lists
  # GET /my/lists.xml
  def index
    @lists = current_user.lists.includes(:tasks)
    @list_feeds = current_user.list_feeds.eager_build
    respond_with(@lists)
  end

  # GET /my/lists/favorites
  # GET /my/lists/favorites.xml
  def favorites
    @lists = current_user.favorites
    respond_with(@lists)
  end

  # GET /my/lists/1
  # GET /my/lists/1.xml
  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

  # GET /my/lists/new
  # GET /my/lists/new.xml
  def new
    @list = List.new
    1.times { @list.tasks.build }
    respond_with(@list)
  end

  # GET /my/lists/1/edit
  def edit
    @list = current_user.lists.find(params[:id])
  end

  # POST /my/lists
  # POST /my/lists.xml
  def create
    @list = current_user.lists.build(params[:list])
    location = @list.save ? my_list_url(@list.id) : new_my_list_url
    respond_with(@list, :location => location )
  end

  # PUT /my/lists/1
  # PUT /my/lists/1.xml
  def update
    @list = current_user.lists.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with(@list, :location => my_list_url(@list))
  end

  # DELETE /my/lists/1
  # DELETE /my/lists/1.xml
  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    respond_with(@list, :location => my_lists_url)
  end
end
