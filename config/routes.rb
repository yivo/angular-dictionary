Rails.application.routes.draw do

  scope :module => :public do
    root 'index#index'
    get '*path', :to => 'index#index'
  end

end