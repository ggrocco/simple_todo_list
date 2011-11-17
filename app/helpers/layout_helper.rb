# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end
  
  # def avatar(current_user)
  #   current_user.avatar? ? current_user.avatar : 
  # end
end