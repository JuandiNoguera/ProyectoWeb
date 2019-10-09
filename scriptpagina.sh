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