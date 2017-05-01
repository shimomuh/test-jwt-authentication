require 'jwt'

class JwtMock
  class ApplicationUser
    def initialize
      @payload = {
        id: 1,
        name: 'shimomuh',
        password: 'uniJ6433YBN9q'
      }
    end

    def build_jwt_client
      rsa_private_key = OpenSSL::PKey::RSA.generate 2048
      @jwt_client = JwtClient.build_with_generating_rsa_keys(rsa_private_key)
    end

    def send_payload_to(server)
      token = @jwt_client.send_token(@payload)
      server.get_token(token)
    end

    def tell_public_key_to(server)
      server.get_public_key(@jwt_client.public_key)
    end
  end

  class JwtClient
    class InvalidKeyError < StandardError; end

    attr_reader :public_key, :token, :decoded_token

    def initialize(private_key, public_key)
      @private_key = private_key
      @public_key = public_key
    end

    def send_token(payload)
      @token = JWT.encode payload, @private_key, 'RS256'
    end

    class << self
      def build_with_generating_rsa_keys(private_key)
        raise InvalidKeyError unless private_key.is_a? OpenSSL::PKey::RSA

        public_key = private_key.public_key
        new(private_key, public_key)
      end

      def decode_token(token, public_key)
        @decoded_token = JWT.decode token, public_key, true, { algorithm: 'RS256' }
      end
    end
  end

  class ApplicationServer
    def initialize; end

    def get_public_key(public_key)
      @public_key = public_key
    end

    def get_token(token)
      @token = token
    end

    def decode_token
      @decoded_token = JwtClient.decode_token(@token, @public_key)
    end

    def analyze_payload
      @decoded_token.first
    end
  end
end
