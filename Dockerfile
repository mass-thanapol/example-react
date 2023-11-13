FROM node:21 as BUILDER

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:21

WORKDIR /app

COPY --from=BUILDER /app/.next ./.next

EXPOSE 3000

CMD ["npm", "start"]

# docker build -t example-react .
# docker run -d -p 80:3000 example-react
