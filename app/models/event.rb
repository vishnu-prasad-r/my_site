class Event < ActiveRecord::Base
attr_accessible  :title, :description, :body, :img, :date
has_attached_file :img , :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
