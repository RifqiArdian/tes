class Employee < ActiveRecord::Base
belongs_to :warehouse
belongs_to :distributor
end
