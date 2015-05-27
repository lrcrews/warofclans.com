# This is thanks to the wonderful world that is stackoverflow:
#   http://stackoverflow.com/a/7156008/686871
#
# Specifically the mock idea as the other part of that answer
# doesn't concern me.  Hah!  Doesn't concern me.  I crack
# myself up.  You've all been great, thanks for having me,
# please tip your waiter and/or waitress.  The 10:30 show is 
# completely different from the eight`o-clock show, see you then.  
# 
# Goodnight!
module SingleAttributeValidateable
  extend ActiveSupport::Concern

  class_methods do

    def validate_attribute(attribute, value)
      attribute = attribute || ""
      if attribute.is_a?(String)
        attribute = attribute.parameterize.underscore.to_sym
      end
      mock = self.new
      if mock.respond_to?(attribute)
        mock[attribute] = value
      end
      mock.valid?
      mock.errors.messages[attribute] || []
    end

  end

end
# Good morning!
# Basically what we did here is mock up whatever this
# class is, set just the value we're checking, then we
# ask it to validate itself (as a whole) and pull out
# just the messages for our attribute, resulting in an
# empty array if no errors were found.
#
# The most obvious limitation here are validations that
# are based on other fields, like 'not this if that',
# in which case I suggest you don't use this.  Or make
# a cool version of this that does that.
#
