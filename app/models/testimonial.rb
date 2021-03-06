# Represents a quote from a user that we feature on the site.
#
# Testimonials are created and managed by admins. They can be based on other objects, such as a
# Pledge or a Review, or any model that implements to_testimonial. Or they can be typed in by
# hand, e.g., if a user emails us a nice quote.
class Testimonial < ActiveRecord::Base
  self.inheritance_column = 'class'  # anything other than "type", to let us use "type" for something else

  TYPES = %w{student donor}

  #--
  # Associations
  #++

  belongs_to :source, polymorphic: true

  #--
  # Validations
  #++

  validates_presence_of :type, message: "Type is required"
  validates_inclusion_of :type, in: TYPES, if: :type
  validates_numericality_of :priority

  #--
  # Scopes
  #++

  scope :display_order, order('priority desc, created_at desc')
  scope :students, scoped_by_type('student')
  scope :donors, scoped_by_type('donor')
end
