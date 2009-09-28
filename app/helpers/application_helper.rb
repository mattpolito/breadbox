# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def active_tab(path)
    current_page?(path) ? { :class => 'active' } : {}
  end
  
  def add_child_link(name, f, method)
    fields = new_child_fields(f, method)
    link_to_function(name, h("insert_fields(this, \"#{method}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def current_year
    Date.today.strftime("%Y")
  end
  
  def cents_to_dollars(value_in_cents)
    number_to_currency((value_in_cents / 100).to_f)
  end
  
  def copyright_date
    Time.now.strftime("%Y")
  end
  
  def displayable_phone_number(phone_number)
    number_to_phone(phone_number(phone_number), :delimiter => '.', :extension => phone_extension(phone_number))
  end

  def long_date(date)
    h(date.strftime("%B %d, %Y"))
  end
  
  def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end

  def phone_extension(phone_number)
    phone_number.slice(10...phone_number.size)
  end

  def phone_number(phone_number)
    phone_number.slice(0...10)
  end
  
  def remove_child_link(name, f)
    f.hidden_field(:_delete) + link_to_function(name, "remove_fields(this)")
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
