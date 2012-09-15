class Court < ActiveRecord::Base
  has_many :fixtures, :dependent => :destroy
end
