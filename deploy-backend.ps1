# Fresh Produce App - Azure Deployment Script
# This script builds and deploys the .NET API to Azure App Service

param(
    [Parameter(Mandatory=$false)]
    [string]$ResourceGroup = "FreshProduceRG",
    
    [Parameter(Mandatory=$false)]
    [string]$AppName = "fresh-produce-api"
)

Write-Host "🚀 Starting Azure Deployment Process..." -ForegroundColor Cyan
Write-Host ""

# Check if Azure CLI is installed
Write-Host "📦 Checking Azure CLI..." -ForegroundColor Yellow
$azInstalled = Get-Command az -ErrorAction SilentlyContinue
if (-not $azInstalled) {
    Write-Host "❌ Azure CLI not found!" -ForegroundColor Red
    Write-Host "Install it from: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli" -ForegroundColor Yellow
    exit 1
}
Write-Host "✅ Azure CLI found" -ForegroundColor Green

# Check if logged in to Azure
Write-Host ""
Write-Host "🔐 Checking Azure authentication..." -ForegroundColor Yellow
$account = az account show 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Not logged in to Azure!" -ForegroundColor Red
    Write-Host "Running: az login" -ForegroundColor Yellow
    az login
}
Write-Host "✅ Azure authenticated" -ForegroundColor Green

# Restore dependencies
Write-Host ""
Write-Host "📥 Restoring .NET dependencies..." -ForegroundColor Yellow
dotnet restore
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to restore dependencies!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Dependencies restored" -ForegroundColor Green

# Build the solution
Write-Host ""
Write-Host "🔨 Building .NET solution (Release mode)..." -ForegroundColor Yellow
dotnet build --configuration Release --no-restore
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Build successful" -ForegroundColor Green

# Publish the API
Write-Host ""
Write-Host "📦 Publishing API..." -ForegroundColor Yellow
$publishPath = ".\FreshProduce.Api\bin\Release\net9.0\publish"
dotnet publish .\FreshProduce.Api\FreshProduce.Api.csproj -c Release -o $publishPath
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Publish failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Publish successful" -ForegroundColor Green

# Create ZIP file for deployment
Write-Host ""
Write-Host "📦 Creating deployment package..." -ForegroundColor Yellow
$zipPath = ".\publish.zip"
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}
Compress-Archive -Path "$publishPath\*" -DestinationPath $zipPath -Force
Write-Host "✅ Package created" -ForegroundColor Green

# Deploy to Azure
Write-Host ""
Write-Host "🚀 Deploying to Azure App Service..." -ForegroundColor Yellow
Write-Host "Resource Group: $ResourceGroup" -ForegroundColor White
Write-Host "App Name: $AppName" -ForegroundColor White
Write-Host ""

az webapp deployment source config-zip `
    --resource-group $ResourceGroup `
    --name $AppName `
    --src $zipPath

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Deployment failed!" -ForegroundColor Red
    Write-Host "Make sure the resource group and app name are correct." -ForegroundColor Yellow
    exit 1
}

# Clean up
Write-Host ""
Write-Host "🧹 Cleaning up..." -ForegroundColor Yellow
Remove-Item $zipPath -Force
Write-Host "✅ Cleanup complete" -ForegroundColor Green

Write-Host ""
Write-Host "🎉 Deployment successful!" -ForegroundColor Green
Write-Host ""
Write-Host "📱 Your API is now live!" -ForegroundColor Cyan
Write-Host "API URL: https://$AppName.azurewebsites.net" -ForegroundColor Blue
Write-Host "Swagger: https://$AppName.azurewebsites.net/swagger" -ForegroundColor Blue
Write-Host ""
Write-Host "View logs with:" -ForegroundColor White
Write-Host "az webapp log tail --resource-group $ResourceGroup --name $AppName" -ForegroundColor Yellow
Write-Host ""
