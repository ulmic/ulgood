module OmniauthTest

  def oauth(provider)
    case provider
      when "vkontakte"
        {
            "provider"=>"vkontakte",
            "uid"=>"1",
            "info"=>
                {
                    "name"=>"Павел Дуров",
                    "image"=>"http://cs7001.vk.me/c7003/v7003079/374b/53lwetwOxD8.jpg",
                }
        }

      when "facebook"
        {
            "provider" => "facebook",
            "uid" => "1234567",
            "info" => {
            "name" => "Joe Bloggs",
            "image" => "http://graph.facebook.com/1234567/picture?type=square",
            #"image"=>"http://cs7001.vk.me/c7003/v7003079/374b/53lwetwOxD8.jpg"
            }
        }
      when "twitter"
        {
            "provider" => "twitter",
            "uid" => "123456",
            "info" => {
                "name" => "John Q Public",
                "image" => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
            }
        }
      when "google"
        {
            "provider" => "google",
            "uid" => "123456789",
            "info" => {
                "name" => "John Doe",
                "image" => "https://lh3.googleusercontent.com/url/photo.jpg"
            }
        }
    end

  end
end
