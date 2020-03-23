module ApplicationHelper
def toast_dispatch
   html = ''
   flash.each do |key, msg|
     html += case key.to_sym
     when :notice
       toastr_success msg
     when :alert
       toastr_error msg
     end
   end

   html.html_safe
 end

 def toast_parse_message msg
   if msg.kind_of? Array
     msg.join("<br>")
   else
     msg
   end
 end

 def toastr_success msg
   javascript_tag "toastr.success('#{toast_parse_message(msg)}')"
 end

 def toastr_info msg
   javascript_tag "toastr.info('#{toast_parse_message(msg)}')"
 end

 def toastr_warning msg
   javascript_tag "toastr.warning('#{toast_parse_message(msg)}')"
 end

 def toastr_error msg
   javascript_tag "toastr.error('#{toast_parse_message(msg)}')"
 end
end
