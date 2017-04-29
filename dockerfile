FROM ruby:2.3-slim
# Instala as dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential nodejs libpq-dev
# Seta o path
ENV INSTALL_PATH /usr/src/app
# Cria o diretorio
RUN mkdir -p $INSTALL_PATH
# Seta o path como diretorio principal
WORKDIR $INSTALL_PATH
# Copia o Gemfile para dentro do container
COPY Gemfile ./
# Instala as Gems
RUN bundle install
# Copia todo o codigo para dentro do container
COPY . .
# Roda o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
