module ListsHelper
  def link_to_add_task(name, field, association)
    new_object = field.object.class.reflect_on_association(association).klass.new
    html = field.simple_fields_for(association, new_object, :child_index => "new_generated_id") do |t|
      render(association.to_s.singularize + "_fields", :task => t)
    end
    link_to_function(name, "add_task(this, '#{escape_javascript(html)}')")
  end
    
  def link_to_remove_task(name, field)
    field.input(:_destroy, :as=> :hidden) + link_to_function(name, "remove_task(this)")
  end
end
