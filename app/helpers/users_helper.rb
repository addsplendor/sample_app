module UsersHelper
    def gravatar_for(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/b58996c504c5638798eb6b511e6f49af"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end
