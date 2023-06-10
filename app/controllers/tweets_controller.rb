class TweetsController < ApplicationController
    def index #Lo que va a haber en el index, tengo que crearle su html.erb propio
        @tweets= Tweet.all #Es @porque es una variable global, que yo pueda usar en otras paginas relacionadas a tweet, en el html

    end

    def show
        @tweet= Tweet.find params[:id]

    end
    
end