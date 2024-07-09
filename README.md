# Rails States App

Este projeto é uma aplicação Rails para gerenciar estados e cidades do sul do Brasil.

## Requisitos

- Docker
- Docker Compose

## Configuração do Ambiente

### Passo 1: Clonar o Repositório

```sh
git clone https://github.com/LeoCortarelli/RailsStatesApp.git
cd RailsStatesApp

Dockerfile: Define o ambiente do Docker para a aplicação Rails.

FROM ruby:2.7: Utiliza a imagem base do Ruby 2.7.
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client: Instala Node.js e o cliente do PostgreSQL.
RUN mkdir /myapp: Cria o diretório /myapp.
WORKDIR /myapp: Define /myapp como o diretório de trabalho.
COPY Gemfile /myapp/Gemfile e COPY Gemfile.lock /myapp/Gemfile.lock: Copia os arquivos Gemfile e Gemfile.lock para o contêiner.
RUN bundle install: Instala as dependências Ruby especificadas no Gemfile.
COPY . /myapp: Copia todos os arquivos do projeto para o contêiner.

docker-compose.yml: Define os serviços do Docker Compose.

db: Serviço para o banco de dados PostgreSQL.
image: postgres: Utiliza a imagem do PostgreSQL.
environment: Define variáveis de ambiente, como POSTGRES_USER e POSTGRES_PASSWORD.
web: Serviço para a aplicação Rails.
build: .: Utiliza o Dockerfile na raiz do projeto.
command: Comando para iniciar o servidor Rails.
volumes: Monta o diretório atual no contêiner.
ports: Mapeia a porta 3000 do contêiner para a porta 3000 do host.
depends_on: Define que o serviço web depende do serviço db.

Gemfile: Lista as dependências Ruby do projeto.

Inclui gemas como rails, pg, puma, sass-rails, webpacker, turbolinks, jbuilder, bootsnap, e rubocop.

Gemfile.lock: Registra as versões exatas das dependências instaladas (arquivo vazio inicialmente).

config/database.yml: Configura o banco de dados para o ambiente de desenvolvimento e teste.

Define a conexão com o PostgreSQL usando as variáveis de ambiente especificadas no docker-compose.yml.

db/migrate/*_create_states.rb e db/migrate/*_create_cities.rb: Arquivos de migração para criar as tabelas states e cities.

create_table
do |t|: Cria a tabela states com uma coluna name.
create_table
do |t|: Cria a tabela cities com colunas name e state_id (chave estrangeira para a tabela states).
db/seeds.rb: Popula o banco de dados com dados iniciais.

Cria estados (State.create) e associa cidades a esses estados (state.cities.create).

config/routes.rb: Define as rotas da aplicação.

resources
, only: [
]: Cria uma rota para listar as cidades (index).
app/controllers/cities_controller.rb: Controlador para a rota de cidades.

def index: Método que recupera e filtra as cidades com base nos parâmetros fornecidos (state_id e name).

app/views/cities/index.html.erb: Template da view para a pesquisa de cidades.

Formulário para filtrar cidades por estado e nome.
Lista as cidades que correspondem aos critérios de pesquisa.
test/controllers/cities_controller_test.rb: Testes para o controlador de cidades.

test "should get index": Verifica se a página de index é carregada com sucesso.
test "should get cities by state": Verifica se a busca por estado funciona.
test "should get cities by name": Verifica se a busca por nome funciona.
.rubocop.yml: Arquivo de configuração do Rubocop (não detalhado no exemplo, mas importante para manter a consistência de estilo de código).
