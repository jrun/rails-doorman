class User
  attr_accessor :login, :roles
  
  def initialize; reset end
  def reset; @login, @roles = '', [] end
  def has_role?(role); @roles.include?(role) end
end
