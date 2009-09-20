module ClientsHelper
  def client_avatar(client)
    image_tag('client.png', :size => '75x75')
    content_tag :label do
      h client.first_name if client.first_name.present?
    end
  end
end
