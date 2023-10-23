Rails.application.config.middleware.insert_before 0, Rack::Cors do
    # allow do
    #   origins '*'
    #   resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    # end
    allow do
        origins 'https://151b-181-78-80-242.ngrok-free.app'
        resource '/informations',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
  end