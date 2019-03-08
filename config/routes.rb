Rails.application.routes.draw do

  get "all_publications", to: 'publication#display'
  post "create_publication", to: "publication#create"
end
