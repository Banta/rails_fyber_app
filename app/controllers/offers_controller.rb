class OffersController < ApplicationController
  def check
  end

  def offers
    require 'fiber_offer_api'

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

      flash[:alert] = arr.to_sentence
      redirect_to offers_check_path and return
    end

  end
end
