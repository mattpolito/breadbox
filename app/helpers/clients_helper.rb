module ClientsHelper
  def client_avatar(client)
    html = image_tag(client.gravatar_url, :alt => 'loading')
    html += content_tag :label do
      h client.first_name unless client.first_name.blank?
    end
    html
  end
end
