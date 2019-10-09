# ProyectoWeb
## Tarea 1
Mkdocs y GitLab Pages

## Tarea 2
Instalación de Mkdocs

    apt install python3-venv # Instalamos el entorno virtual

    python3 -m venv Desarrollo # Crear entorno virtual

    source Desarrollo/bin/activate # Activar el entorno

    pip install mkdocs # Instalar el generador

    mkdocs new Project1 # Crear un proyecto

    mkdocs serve # Iniciar pagina
    INFO - Building documentation...
    INFO - Cleaning site directory
    [I 190926 10:31:14 server:296] Serving on http://127.0.0.1:8000
    [I 190926 10:31:14 handlers:62] Start watching changes
    [I 190926 10:31:14 handlers:64] Start detecting changes
    [I 190926 10:31:30 handlers:135] Browser Connected: http://127.0.0.1:8000/
    ^C[I 190926 10:32:17 server:318] Shutting down...

Desarrollado en Python

Plantillas en Jinja2

## Tarea 3
Para configurar el sitio, tema y demas complementos se editara el fichero mkdocs.yml
_site_name: Formula1
theme: 'material'
repo_url: 'https://github.com/JuandiNoguera/ProyectoWeb'
extra:
   social:
      - type: 'twitter'
link: 'https://twitter.com/f1'_

Para elegir un tema tenemos que descargarlo previamente Ej: pip install mkdocs-material

Para configurar nombre de sitio: site_name: Formula1

Para cambiar el tema: theme: 'material'

Para añadir un enlace en la barra de arriba de tu github: repo_url: 'https://github.com/JuandiNoguera/ProyectoWeb'

Para añadir un icono de la aplicación especificada en la parte inferior:

extra:
   social:
      - type: 'twitter'
        link: 'https://twitter.com/f1'
      - type: 'facebook'
        link: 'https://facebook.com/Formula1'


## Tarea 4
- Repositorio de github del generador: https://github.com/JuandiNoguera/ProyectoWeb/

-Repositorio de gitlab del sitio generado: https://gitlab.com/JuandiNoguera/formula1

-Pagina web: https://juandinoguera.gitlab.io/formula1/

## Tarea 5
Para desplegar la aplicación en gitlab pages subí el HTML generado por MKDOCS a un repositorio de gitlab(https://gitlab.com/JuandiNoguera/formula1)

Para crear la pagina tuve que crear un archivo .gitlab-ci.yml con el siguiente contenido:

    pages:
      stage: deploy
      script:
      - mkdir .public
      - cp -r * .public
      - mv .public public
      artifacts:
        paths:
        - public
      only:
      - master

En gitlab nos vamos a Settings > General > Advanced y le damos nombre al proyecto para poder acceder a el

## Tarea 6

El script es el siguiente:

#!/bin/bash

cd /home/juandi/.virtualenv
source Desarrollo/bin/activate
cd /home/juandi/github/ProyectoWeb/
git add .
git commit -m "$1"
git push origin master
mkdocs build --clean -d ../formula1/
mkdocs build -d ../formula1/
cd /home/juandi/github/formula1
git add .
git commit -m "$1"
git push origin master
deactivate
