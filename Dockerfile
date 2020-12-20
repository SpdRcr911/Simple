FROM mcr.microsoft.com/dotnet/aspnet:3.1
EXPOSE 80

RUN apt update
RUN apt install nodejs npm -y
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN npm install -g newman

WORKDIR /app
COPY out/ ./
COPY *.json ./
ENTRYPOINT ["dotnet", "Simple.WebApi.dll"]