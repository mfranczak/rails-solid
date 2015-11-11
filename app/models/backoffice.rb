# [ISP] When the module is included the extended class has more methods than it should
#       e.g. fulltime clown doesn't need certificate as student needs.
#       To fix:
#         Split this class into three submodules: Base, Costume, Certificate.
#         Change Backoffice to include Costume and Certificate
#         Costume and Certificate should include Base which holds the common call_api method
#
# [META] As you can see methods are calling the call_api with exact name of the Booking method, maybe it's possible to
#        apply some meta programming techniques

module Backoffice
  include Costume
  include Certificate
end