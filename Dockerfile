# Usamos uma imagem leve do Node
FROM node:18-alpine

# Pasta onde o app vai morar no container
WORKDIR /app

# Copiamos os arquivos de pacotes primeiro (otimiza cache)
COPY package*.json ./

# Instalamos as dependências (mesmo que não tenha agora, é o padrão)
RUN npm install --production

# Copiamos o resto do código
COPY . .

# Porta que o container vai expor
EXPOSE 3000

# Comando para ligar o app
CMD ["node", "index.js"]