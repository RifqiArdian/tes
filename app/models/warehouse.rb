class Warehouse < ActiveRecord::Base
has_many :employees
belongs_to :distributor
end
