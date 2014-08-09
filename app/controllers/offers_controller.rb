class OffersController < ApplicationController
  def check
  end

  def offers
    require 'fiber_offer_api'
    @validated = false
    @success = false
    if params[:uid].blank? || params[:pub0].blank? || params[:page].blank?
      arr = []
      if params[:uid].blank?
        arr << "UID is required"
      end

      if params[:pub0].blank?
        arr << "Pub0 is required"
      end

      if params[:page].blank?
        arr << "Page is required"
      end

      flash[:alert].now = arr.to_sentence
    else
      @validated = true
    end

    fiber_offer_api = FiberOfferApi.new(params[:uid], params[:pub0], params[:page])

    if fiber_offer_api.success
      flash[:notice] = fiber_offer_api.body['message']
      @offers = fiber_offer_api.body['offers']
      @success = true
    else
      flash[:alert] = "#{fiber_offer_api.body['code']}: #{fiber_offer_api.body['message']}. Please try again or contact admin"
    end

  end
end
