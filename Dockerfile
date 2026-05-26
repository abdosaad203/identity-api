# Build Stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY Identity.API/Identity.API.csproj Identity.API/
COPY Identity.API.Tests/Identity.API.Tests.csproj Identity.API.Tests/

RUN dotnet restore Identity.API/Identity.API.csproj

COPY . .

RUN dotnet publish Identity.API/Identity.API.csproj \
    -c Release \
    -o /app/publish \
    /p:UseAppHost=false

# Runtime Stage
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
RUN useradd -m appuser

COPY --from=build /app/publish .

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8080

ENV ASPNETCORE_URLS=http://+:8080

ENTRYPOINT ["dotnet", "Identity.API.dll"]