class Rose < ActiveRecord::Base
    belongs_to :user # a macro generates code 
    validates_presence_of :rose_name
    validate :rose_name
end