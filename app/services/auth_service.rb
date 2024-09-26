class AuthService
    include HTTParty
    base_uri 'http://localhost:3001'  # URL del microservicio de autenticación
  
    def self.register(user_params)
      post('/register', body: user_params.to_json, headers: { 'Content-Type' => 'application/json' })
    end
  
    def self.login(credentials)
      post('/login', body: credentials.to_json, headers: { 'Content-Type' => 'application/json' })
    end
  
    def self.verify_token(token)
      # Si tu microservicio de autenticación tiene un endpoint para verificar tokens,
      # puedes implementarlo aquí. Si no, el API Gateway puede hacerlo directamente.
      begin
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
        decoded_token["user_id"]
      rescue JWT::DecodeError
        nil
      end
    end
  end
  