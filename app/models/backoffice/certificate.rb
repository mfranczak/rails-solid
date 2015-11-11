module Backoffice
  module Certificate
    include Base

    # this method prepares a confirmation certificate for the clown
    def certificate_prepare(booking)
      call_api :certificate_prepare, booking
    end

    # this method sends a confirmation certificate
    def certificate_send(booking)
      call_api :certificate_send, booking
    end

  end
end