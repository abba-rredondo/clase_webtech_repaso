class Tweet < ApplicationRecord
    belongs_to :user
    has_many :tags
    attribute :hashtags

    after_create :create_tags

    def create_tags
        hashtags.split(',').each do |h|
            hashtag = Hashtag.find_or_create_by name: h
            Tag.create tweet: self, hashtag: hashtag
            
        end
    end
    def creation_date
        created_at.strftime("%e %b %Y") #Busqué en google el strftime y me da todas las opciones de formato, si quiero con / la fecha
        #es lo mismo pero en vez de espacio es /
    end

    def list_hashtags
        tags.map{ |t| t.hashtag.name }.join(',') #Map lo que hace es aplicar la función del parentesis a todos los elementos
    end
end