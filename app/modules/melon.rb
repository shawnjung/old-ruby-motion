module MelonAPI
  class Search
    APP_KEY = 'f973402f-4f71-334e-8b49-0210fa7701c3'

    def initialize(keyword, attributes ={})
      @keyword = keyword
      @type    = attributes[:type] || 'songs'
      @version = attributes[:version] || 1
      @page    = attributes[:page] || 1
      @count   = attributes[:count] || 50
    end

    def fetch(&callback)
      url = "http://apis.skplanetx.com/melon/#{@type}?version=#{@version}&page=#{@page}&count=#{@count}&searchKeyword=#{@keyword}"
      BW::HTTP.get url, headers: {appKey: APP_KEY} do |responce|
        callback.call responce.body
      end
    end
  end
end
