# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build
#WORKDIR /app
EXPOSE 80
EXPOSE 443
 
 
# Copy csproj and restore as distinct layers
COPY . ./
RUN dotnet restore
 
# Copy everything else and Build
RUN dotnet build -c Release -o /app/publish
#RUN dotnet build
 
FROM build AS publish
RUN dotnet publish
 
# FROM publish AS final
 
 
ENV ASPNETCORE_URLS=http://+:80
ENTRYPOINT ["dotnet", "run"]
