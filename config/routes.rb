Rails.application.routes.draw do
  get 'welcome_page/welcome'
  get 'users/show'
  root 'welcome_page#welcome'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
