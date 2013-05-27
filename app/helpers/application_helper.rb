module ApplicationHelper
  def error_div(model, field, field_name)  
      return unless model  
      field = field.is_a?(Symbol) ? field.to_s : field  
      errors = model.errors[field]  
      return unless errors  
      %Q(  
      <div class="errors">  
      #{errors.is_a?(Array) ? errors.map{|e| field_name + e}.join(",") : field_name << errors}  
      </div>  
      )  
    end
    
    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
      errors = Array(instance.error_message).join(',')
      %(#{html_tag}<span class="validation-error">&nbsp;#{errors}</span>).html_safe
    end
end
