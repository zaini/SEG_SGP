# Define customization methods inside Name class.

require 'faker'
module Faker
class Name < Base
    class << self
        def account_name; fetch('name. account_name'); end
        def description; fetch('name. description '); end
    end
end
end