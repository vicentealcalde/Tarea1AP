# Utiliza la imagen oficial de Ruby como base
FROM ruby:3.2.2

# Instala dependencias del sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configura el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo Gemfile y Gemfile.lock al directorio de trabajo
COPY Gemfile Gemfile.lock /app/

# Instala las gemas
RUN bundle install


# Copiar el resto de los archivos de la aplicación al directorio de trabajo
COPY . /app/

# Exponer el puerto 3000 en el contenedor
EXPOSE 3000

# Definir el comando para iniciar el servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
