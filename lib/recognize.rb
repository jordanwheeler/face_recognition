class Recognize

require 'face'
require 'debugger'

  def with_session(&block)
    @client = Face.get_client(:api_key => FaceRecognition::Application.config.api_key, :api_secret => FaceRecognition::Application.config.api_secret)
    yield
  end

  def individual_entry(urls, name)
    with_session do
      uid = name.downcase.gsub(/\s/, '_') +"@shopify"
      get_tid(urls)
      save_tags(@tid, uid, name)
    end
  end

  def group_entry(url, name)
    with_session do
      uid = name.downcase.gsub(/\s/, '_') +"@shopify"
      x = @client.faces_group(urls: url)
    end
  end

  def get_tid(url)
      x = @client.faces_detect(urls: url)
      @tid = x['photos'].first['tags'].first['tid']
  end

  def save_tags(tid, uid, name=nil)
      @client.tags_save(tids: tid, uid: uid, label: name)
      @client.faces_train(uids: uid)
  end

  def recognize(url)
    with_session do
      x = @client.faces_recognize(uids: 'all@shopify', urls: url)
      x['photos'].first['tags'].first['uids']
    end
  end

end