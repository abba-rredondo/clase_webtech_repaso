class Tweet < ApplicationRecord
    belongs_to :user
    has_many :tags
    def creation_date
        created_at.strftime("%e %b %Y") #Busqué en google el strftime y me da todas las opciones de formato, si quiero con / la fecha
        #es lo mismo pero en vez de espacio es /
    end
end