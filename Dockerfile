# docker build -t todoapi .
# docker run -d -p 8080:80 --name api todoapi
# docker run --rm -it -v /home/vincent/Documents/GitHub/TodoApi:/app/ -w /app/TodoApi microsoft/dotnet:2.1-sdk dotnet watch run
FROM microsoft/dotnet:sdk AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "TodoApi.dll"]