require 'spec_helper'
describe ListsHelper do
  context "link_to_remove_task" do
    before(:each) do
      @template = ActionView::Base.new
      @template.output_buffer = ""
      @builder = SimpleForm::FormBuilder.new(:tasks, Task.new, @template, {}, proc {})
    end
    
    it "add the link_to_remove_task" do
      @builder.simple_fields_for :tasks do |t|
        helper.link_to_remove_task("remove", t).should == "<input class=\"hidden\" id=\"tasks_tasks__destroy\" name=\"tasks[tasks][_destroy]\" type=\"hidden\" /><a href=\"#\" onclick=\"remove_task(this); return false;\">remove</a>"
      end
    end
    
    it "and can't accept empty result" do
      @builder.simple_fields_for :tasks do |t|
        helper.link_to_remove_task("remove", t).should_not == ""
      end
    end
  end
  
end
