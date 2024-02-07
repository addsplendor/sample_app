module UsersHelper
    def gravatar_for(user)
        gravatar_url = "https://secure.gravatar.com/avatar/9717af0dabd5aebb7527cd4afaf2d9e8"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end
