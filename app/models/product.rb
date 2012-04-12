class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title
end
