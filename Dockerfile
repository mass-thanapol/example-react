FROM node:21 as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:21

WORKDIR /app

COPY --from=build /app/.next ./.next

RUN npm install --only=production

EXPOSE 3000

CMD ["npm", "start"]


# docker build -t example-react .
# docker run -d -p 80:3000 example-react

