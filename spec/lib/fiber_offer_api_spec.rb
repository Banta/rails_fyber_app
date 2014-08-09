require 'spec_helper'

describe 'FiberOfferApi' do

  before(:each) do
    @appid = 157
    @device_id = '2b6f0cc904d137be2e1730235f5664094b831186'
    @locale = 'de'
    @ip = '109.235.143.113'# (german IP)'
    @offer_types = 112
    @api_Key = 'b07a12df7d52e6c118e5d47d3f9e60135b109a1f'
  end

  describe 'FiberOfferApi#new()' do
    context "response" do
       it "should be success if api key and other things are correct" do
         response = FiberOfferApi.new(1, 'campaigns2', 1)
         expect(response.success).to be true
       end

       it "should return a json body" do
         response = FiberOfferApi.new(1, 'campaigns2', 1)
         expect(response.body.class).to be Hash
       end

       it "should return 401 code if api key is wrong" do
         Rails.application.secrets.fiber_api_key = "***ue37248237t####"
         response = FiberOfferApi.new(1, 'campaigns2', 1)
         expect(response.code).to be 401
       end

       it "should return 'ERROR_INVALID_HASHKEY' code if api key is wrong" do
         Rails.application.secrets.fiber_api_key = "***ue37248237t####"
         response = FiberOfferApi.new(1, 'campaigns2', 1)
         expect(response.body['code']).to eql 'ERROR_INVALID_HASHKEY'
       end
    end
  end
end

