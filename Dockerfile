# aquí define la imagen base que se va a usar, puede ser ubuntu, python, etc.
FROM node:10

# partiendo del contexto de build, copia lo que yo le pida del contexto a la ruta de mi imagen nueva.
# docker build -t anturyapp . : crea la imagen con el contexto - . - y se llamará anturyapp.
# Permite copiar archivos del sistema a una ruta específica dentro del contenedor, 
# por lo general estos archivos están en la misma carpeta del Dockerfile.
COPY [".", "/usr/src/"]

# define el directorio donde se está ubicando dentro del contenedor, 
# es similar a usar el cd en la consola/terminal
WORKDIR /usr/src

# ejecuta un binario instalado en el contenedor, en este caso se usa npm install, 
# pero puede ser cualquier otro binario.
RUN npm install

# corre el contenedor con nuestra imagen y conectamos nuestro host con el contenedor por el puerto 3000.
# Permite exponer un puerto del contenedor para que pueda ser usado desde el sistema host (tu sistema operativo)
EXPOSE 3000

# por lo genera es el último comando y es el que se va a ejecutar siempre que se inicie el contenedor,
# los otros solo se van a ejecutar en caso que exista un cambio que haga que se regenere o reconstruya el contenedor.
CMD ["node", "index.js"]
