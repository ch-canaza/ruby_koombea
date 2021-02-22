module ApplicationHelper

  def link_to_add_fields(name, f, association)
    ##  create a new object for the association :contacy_links
    new_object = f.object.send(association).klass.new
    
    ## take the id for the created object
    id = new_object.object_id
    
    ## create the fields form
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
      
    end
    
    ## pass down the links to the fields form
    link_to(name, '#', class: 'add_fields', data: {id: id, fields: fields.gsub("\n", "")})

  end

  def gravatar_for(user, options = { size: 80 })
    email_address = (user.email.downcase) 
    size = options[:size]
    hash = Digest::MD5.hexdigest(email_address)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.name)
  end


 
end
