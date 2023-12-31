class TweetsController < ApplicationController
    def index #Lo que va a haber en el index, tengo que crearle su html.erb propio
        @tweets= Tweet.all #Es @porque es una variable global, que yo pueda usar en otras paginas relacionadas a tweet, en el html

    end

    def show
        @tweet= Tweet.find params[:id]

    end

    def new
        @tweet = Tweet.new
    end

    def create #ES CREATE NO CREATED
        tweet= Tweet.new tweet_params #SOlo va a aceptar los parametros que yo señalo, por terminso de seguridad
        tweet.user = current_user #Porque necesita un usuario al que estar asociado para poder guardarse
        if tweet.save
            redirect_to tweet, notice: 'Tweet guardado con éxito'
        else
            render :new
    
        end
    end

    def destroy
        tweet = Tweet.find params[:id]
        tweet.destroy
        redirect_to tweets_path, notice: 'Tweet eliminado con éxito'
    end

    private #FUnciones privadas que estoy definiendo
    def tweet_params
        params.require(:tweet).permit(:body, :hashtags) #Esto me dice, solo te acepto un body, lo que es IMPORTANTISIMO, debido a que si no, 
        #pueden meterme otras cosas en el campo y hackearme porque pueden meter comandos
    end
 #si pongo debugger eso va a hacer que se me ejecute hasta esa linea los comandos, luego cuando pongo n, voy a la siguiente linea, sirve
 #para debugear
    
end