Rails.application.routes.draw do
  get 'offers/check'

  get 'offers/offers'

  root 'offers#check'
end
