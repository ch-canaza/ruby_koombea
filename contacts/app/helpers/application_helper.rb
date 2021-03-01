# frozen_string_literal: true

# defines methods to add new functionalities
module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new

    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("#{association.to_s.singularize}_fields", f: builder)
    end
    link_to(name, '#', class: 'add_fields btn btn-info', data: { id: id, fields: fields.gsub("\n", '') })
  end

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    size = options[:size]
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.name)
  end
end
