# [ISP] When the module is included the extended class has more methods than it should
#       e.g. fulltime clown doesn't need certificate as student needs.
#       To fix:
#         Split this class into three submodules: Base, Costume, Certificate.
#         Change Backoffice to extend Costume and Certificate
#         Costume and Certificate should include Base which holds the common call_api method
#       We are going to use this modules in the next step
#
# [META] As you can see methods are calling the call_api with exact name of the Booking method, maybe it's possible to
#        apply some meta programming techniques

module Backoffice
  # this method prepares a confirmation certificate for the clown
  def certificate_prepare(booking)
    call_api :certificate_prepare, booking
  end

  # this method sends a confirmation certificate
  def certificate_send(booking)
    call_api :certificate_send, booking
  end

  # this method sends a request to borrow a costume for the clown
  def costume_borrow(booking)
    call_api :costume_borrow, booking
  end

  # informs that costume was returned
  def costume_return(booking)
    call_api :costume_return, booking
  end

  # informs that costume was returned
  def costume_mark_as_broken(booking)
    call_api :costume_mark_as_broken, booking
  end

  def call_api(method, booking)
    # does an api call
    true
  end
end