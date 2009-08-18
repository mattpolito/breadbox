module DashboardHelper
  def status_class(status)
    case status
    when 'draft'
      { :class => 'draft' }
    when 'sent'
      { :class => 'sent' }
    when 'paid'
      { :class => 'paid' }
    end
  end
end
