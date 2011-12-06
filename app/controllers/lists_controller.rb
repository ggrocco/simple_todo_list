class ListsController < ApplicationController
  
   before_filter :authenticate_user!, :except => [:index, :show]
   
  # GET /lists
  # GET /lists.xml
  def index
    @lists = List.all_public
    respond_with(@lists)
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    @list = List.all_public.find(params[:id])
    respond_with(@list)
  end
  
  # POST /lists/1/follow
  # POST /lists/1/follow.xml
  def follow
    @list = List.all_public.find(params[:id])
    current_user.favorites << @list
    current_user.save
    respond_with(@list, :location => favorites_my_lists_url)    
  end

  # POST /lists/1/unfollow
  # POST /lists/1/unfollow.xml
  def unfollow
    @list = current_user.favorites.find(params[:id])
    current_user.favorites.delete(@list)
    respond_with(@list, :location => favorites_my_lists_url)
  end
end
