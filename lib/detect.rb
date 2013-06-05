class Detect

require 'face'

  def self.upload
    client = Face.get_client(:api_key => FaceRecognition::Application.config.api_key, :api_secret => FaceRecognition::Application.config.api_secret)
    client.faces_detect(:urls => ['http://4.bp.blogspot.com/-T2UC3extWjQ/UD5Ws7vMiNI/AAAAAAAAARs/By-_5LGbfJA/s220/Dave%2B-%2BHead%2BShot.jpg'])
  end

end