class Distributor < ActiveRecord::Base
has_many :employees
has_many :warehouses
end
