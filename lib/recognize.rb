class Recognize

require 'face'
require 'debugger'

  def with_session(&block)
    @client = Face.get_client(:api_key => FaceRecognition::Application.config.api_key, :api_secret => FaceRecognition::Application.config.api_secret)
    yield
  end

  def new_entry(urls, name)
    with_session do
      uid = name.downcase.gsub(/\s/, '_') +"@shopify"
      get_tid(urls)
      save_tags(@tid, uid, name)
    end
  end

  def get_tid(urls)
      x = @client.faces_detect(urls: [urls])
      @tid = x['photos'].first['tags'].first['tid']
  end

  def save_tags(tid, uid, name=nil)
      @client.tags_save(tids: tid, uid: uid, label: name)
      @client.faces_train(uids: uid)
  end

  def recognize(uids, urls)
    with_session do
      x = @client.faces_recognize(uids: [uids], urls: [urls])
      x['photos'].first['tags'].first['uids']
    end
  end

end