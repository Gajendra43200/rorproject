class Admin < User
     has_many :services
     # self.inheritance_column = :type
end