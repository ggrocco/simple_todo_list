class ListsController < ApplicationController
  
  # GET /lists
  # GET /lists.xml
  def index
    @lists = List.all_public
    respond_with(@lists)
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    @list = List.find(params[:id])
    respond_with(@list)
  end

end
