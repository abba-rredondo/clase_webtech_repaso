# README

**Clase semestre webtech:**

Hoy dia vamos hacer esto en base a la metodologia AGILE. La metodologia agile te permite presentarle cosas al cliente mas rapido, hacer una funcionalidad completa consus vistas, controladores, modelos.

Generalmente se hace Modelos|Controladores|Vistas, se hace un corte vertical de manera que se tenga algo que mostrar,
es como avanzar de forma vertical, avanzas en todo un poco de manera que tengas algo que mostrar.

Se supone que vamos a ver algo llamado git flow, que es una forma de git donde usa una rama en vez de ir actualizando la principal.

# Lo que vamos a ver en la primera parte.
* Crear una base.
* Definir el layout de la base.
* Crear modelo de User con Device.
* Crear tabla y modelo para Tweet.

# Paso a paso

1. Ver que estemos en la version correcta ruby -v (tiene que ser la 3.2.0) y en node -v (tiene que ser una mayor a 18). Si no se está en la versión correcta, buscar en google como cambiarla.

2. Hacemos rails new: para crear la app.
    ~~~
    $ rails new simple_twitter --database postgresql -j esbuild -css bootstrap
    ~~~
    Corremos:
    ~~~
    rails s
    ~~~ 
    Para ver si funciona y si lanza error en la base de datos, que suele pasar con postgres, es porque falta crear la base de datos, esto se soluciona haciendo un:
    ~~~
     rails db:create 
     ~~~
     y ahora hacemor un commit, no esperamos a tener medio avance para hacer coomits.
     Recordar que para el commit lo que se hace es:

     1. **Si no lo tengo asociado aún hago:**
        ~~~
        git add .
        
        git commit -m"feat: crear aplicacion con rails new2 -m"segundo mensaje"

        git branch -M main

        git remote add origin (link del git)

        git push -u origin main
        ~~~
     2. **Si lo tengo asociado hago:**
        ~~~
        git add .
        
        git commit -m"feat: crear aplicacion con rails new2 -m"segundo mensaje"}

        git push -u origin main
        ~~~

3. Vamos a probar altiro bootstrap, para ver si corre ya que si lanza error sabemos que hay que arreglar algo. Por lo que empezamos creando el static_pages (una nueva vista y controlador base para la webapp).

4. Primero agregamos la ruta
    ~~~
    root "static_pages#home"
    ~~~
    Para poder enlazar basicamente el home de la pagina con static_pages

5. Agregamos ahora el controlador static_pages donde hacemos la home.
   
    El controlador se crea a mano o con un comando, en este caso lo hicimos a mano, creando en LA CARPETA controllers, el archivo static_pages_controller.rb y luego ponemos la función adentro.
    ~~~
    class StaticPagesController < ApplicationController
        def home
        end
    end
    ~~~

6. ahora con esto lo que haremmos sera crear una carpeta en views con el mismo nombre del controlador.
   
    En las views, agregamos una carpeta llamada static_pages (siempre fijarse en tener el mismo nombre porque todo con el mismo nombre, ruby sabe que tiene relacion y por ello se conectan).

7. dentro de esta carpeta, creamos un home.html.erb
esta va a ser mi vista principal. Y con eso tenemos lista nuestra vista del home de static_pages.
   
8. Para el nav bar creamos en las views/layouts un _navbar.html.erb
    Este va a ser mi partial, debido a que en este me voy a dedicar a hacer todo lo del navbar, ponerlo lindi y eso, (el navbar lo saqué de bootstrap 5.0, **tengo que usar el de la version 5.0**), la cosa es que despues lo voy a unir en application.html.erb, el que es una plantilla de diseño principal en Ruby on Rails, es como la base de todo, es donde se pone el nombre de la pestañita, la navbar, y cosas como bases, el aplication es mi base. Porque tu visual de la pagina principal va a estar en static_pages.
    
9. Entonces, en application.html.erb que esta en layouts hacemos un
~~~
<body>
    <%= render partial: 'layouts/navbar' %>
    <%= yield %>
  </body>
~~~
Al yo decirle partial, va a buscar el archivo que tenga _ y por eso lo ponemos como navbar nomas. 
Esto lo puedo hacer para cualquier elementos, porque puedo poner en un archivo de _ elementos que yo quiera en formato html.erb, ya sea con fines de orden u otra cosa, y luego en la pagina donde quiero que se muestre uso el render partial y con esto le voy a decir, toma lo de partial, y pegalo en este html.

Porque eso significa, que tu vas a tener en el body de application, el navbar, es como "enlazarlo". 

10. Ahora, vamos a nuestra url y vemos si todo funciona bien en nuestra pagina, en nuestro caso tuvimos un error con la navbar, de que no funcionaba el dropdown, **el dropdown es lo que nos señala si funciona o no el bootstrap, es mejor revisarlo altiro para no ir acumulando problemas** para solucionar esto, se hizo como una reinstalación del bootstrap, ejecitando la siguiente linea de comandos:

    ~~~
    bundle add cssbundling-rails
    ./bin/rails css:install:bootstrap
    yarn build:css
    yarn add @hotwired/turbo-rails
    yarn add @hotwired/stimulus
    yarn
    yarn build
    ~~~

    Esto basicamente es como que instala bootstrap para el css y en lo ultimos dos comandos, el yarn es para instalar paquetes y el yarn build y lo que hace es que te compila todo.

11. Metamosle mano al navbar

