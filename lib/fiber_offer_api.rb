class FiberOfferApi
  attr_accessor :success, :code, :body

  def initialize(uid, pub0, page)
    @fiber_api_key = Rails.application.secrets.fiber_api_key
    @fiber_device_id = Rails.application.secrets.fiber_device_id

    @params = {
        appid: 157,
        uid: uid,
        ip: '109.235.143.113',
        locale: 'de',
        device_id: @fiber_device_id,
        ps_time: Time.now.to_i,
        pub0: pub0,
        page: page,
        timestamp: Time.now.to_i,
        offer_types: 112
    }

    response = Typhoeus::Request.get("api.sponsorpay.com/feed/v1/offers.json",
        method: :get,
        params: @params.merge({hashkey: getHashKey}),
    )

    @success = response.success?
    @code = response.code
    @body = JSON.parse(response.body)
  end

  def getHashKey
    sorted_stringified_params = (@params.sort.inject([]) do |accu, (key, value)|
      accu << key.to_s + '=' + value.to_s
      accu
    end).join('&') + "&#{@fiber_api_key}"

    Digest::SHA1.hexdigest(sorted_stringified_params).to_s
  end
end
