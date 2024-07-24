ARG NODE_VERSION=20.15.1

FROM --platform=arm64 node:${NODE_VERSION}-alpine AS backend

WORKDIR /frontend

COPY package.json package-lock.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "3000"]