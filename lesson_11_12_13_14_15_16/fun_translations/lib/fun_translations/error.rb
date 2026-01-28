# frozen_string_literal: true

module FunTranslations
  # StandardError
  # - Error
  # -- ClientError
  # --- BadRequest
  # -- ServerError
  # --- NotImplemented
  class Error < StandardError
    ClientError = Class.new(self)
    ServerError = Class.new(self)

    class BadRequest < ClientError
    end

    class Unauthorized < ClientError
    end

    class NotAcceptable < ClientError
    end

    class NotFound < ClientError
    end

    class Conflict < ClientError
    end

    class TooManyRequests < ClientError
    end

    class Forbidden < ClientError
    end

    class Locked < ClientError
    end

    class MethodNotAllowed < ClientError
    end

    class NotImplemented < ServerError
    end

    class BadGateway < ServerError
    end

    class ServiceUnavailable < ServerError
    end

    class GatewayTimeout < ServerError
    end

    ERRORS = {
      400 => FunTranslations::Error::BadRequest,
      401 => FunTranslations::Error::Unauthorized,
      403 => FunTranslations::Error::Forbidden,
      404 => FunTranslations::Error::NotFound,
      405 => FunTranslations::Error::MethodNotAllowed,
      406 => FunTranslations::Error::NotAcceptable,
      409 => FunTranslations::Error::Conflict,
      423 => FunTranslations::Error::Locked,
      429 => FunTranslations::Error::TooManyRequests,
      500 => FunTranslations::Error::ServerError,
      502 => FunTranslations::Error::BadGateway,
      503 => FunTranslations::Error::ServiceUnavailable,
      504 => FunTranslations::Error::GatewayTimeout
    }.freeze

    def self.from_response(body)
      msg = body[:detail] || body[:message]
      new msg.to_s
    end
  end
end
