# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def active_tab(path)
    request.path.match(/^#{path}/) ? { :class => 'active' } : {}
  end
  
  def add_child_link(name, association)
    link_to(name, "javascript:void(0)", :class => "add_child", :"data-association" => association)
  end
  
  def current_year
    Date.today.strftime("%Y")
  end
  
  def cents_to_dollars(value_in_cents)
    number_to_currency((value_in_cents.to_f / 100))
  end
  
  def copyright_date
    Time.now.strftime("%Y")
  end
  
  def displayable_phone_number(phone_number)
    number_to_phone(phone_number(phone_number), :delimiter => '.', :extension => phone_extension(phone_number))
  end
  
  def edit_action
    controller.action_name == 'edit'
  end
  
  def format_address(address_parts)
    list_items = ""
    address_parts.each do |part|
      list_items += content_tag :li, part 
    end
    list_items
  end

  def long_date(date)
    h(date.strftime("%B %d, %Y"))
  end
  
  def new_child_fields_template(form_builder, association, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s.singularize
    options[:form_builder_local] ||= :f
    
    content_tag(:table, :id => "#{association}_fields_template", :style => "display: none") do
      form_builder.fields_for(association, options[:object], :child_index => "new_#{association}") do |f|
        render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
      end
    end
  end

  def phone_extension(phone_number)
    phone_number.slice(10...phone_number.size) unless phone_number.blank?
  end

  def phone_number(phone_number)
    phone_number.slice(0...10) unless phone_number.blank?
  end
  
  def remove_child_link(name, f)
    f.hidden_field(:_delete) + link_to(name, "javascript:void(0)", :class => "remove_child")
  end
  
  def send_notification_link(invoice)
    if invoice.sent?
      link_to 'Send Reminder', deliver_path(:type => 'reminder', :id => invoice), :id => 'deliver', :class => 'button'      
    else
      link_to 'Send Invoice', deliver_path(:type => 'invoice', :id => invoice), :id => 'deliver', :class => 'button'
    end
  end

  def short_date(date)
    h(date.strftime("%m.%d.%Y"))
  end
  
  def title(title)
    content_for :title do
      "#{title} - Breadbox"
    end
  end
end
