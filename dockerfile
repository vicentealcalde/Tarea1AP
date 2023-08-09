# Utiliza la imagen oficial de Ruby como base
FROM ruby:3.2.2

# Instala dependencias del sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configura el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el Gemfile y el Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instala las gemas
RUN bundle install

# Copia el resto de los archivos de la aplicación al contenedor
COPY . .

# Expone el puerto 3000 para el servidor Rails
EXPOSE 3000

# Inicia el servidor Rails cuando el contenedor se ejecute
CMD ["rails", "s"]
