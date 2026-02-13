# Fresh Produce App - Firebase Deployment Script
# This script builds and deploys the Flutter web app to Firebase Hosting

Write-Host "🚀 Starting Firebase Deployment Process..." -ForegroundColor Cyan
Write-Host ""

# Navigate to Flutter UI directory
Set-Location -Path "fresh_produce_ui"

# Check if Firebase is installed
Write-Host "📦 Checking Firebase CLI..." -ForegroundColor Yellow
$firebaseInstalled = Get-Command firebase -ErrorAction SilentlyContinue
if (-not $firebaseInstalled) {
    Write-Host "❌ Firebase CLI not found!" -ForegroundColor Red
    Write-Host "Install it with: npm install -g firebase-tools" -ForegroundColor Yellow
    exit 1
}
Write-Host "✅ Firebase CLI found" -ForegroundColor Green

# Check if logged in to Firebase
Write-Host ""
Write-Host "🔐 Checking Firebase authentication..." -ForegroundColor Yellow
firebase projects:list 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Not logged in to Firebase!" -ForegroundColor Red
    Write-Host "Running: firebase login" -ForegroundColor Yellow
    firebase login
}
Write-Host "✅ Firebase authenticated" -ForegroundColor Green

# Get Flutter dependencies
Write-Host ""
Write-Host "📥 Getting Flutter dependencies..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to get dependencies!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Dependencies installed" -ForegroundColor Green

# Build Flutter web app
Write-Host ""
Write-Host "🔨 Building Flutter web app (Release mode)..." -ForegroundColor Yellow
flutter build web --release --web-renderer canvaskit
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✅ Build successful" -ForegroundColor Green

# Deploy to Firebase
Write-Host ""
Write-Host "🚀 Deploying to Firebase Hosting..." -ForegroundColor Yellow
firebase deploy --only hosting
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Deployment failed!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎉 Deployment successful!" -ForegroundColor Green
Write-Host ""
Write-Host "📱 Your app is now live!" -ForegroundColor Cyan
Write-Host "Visit Firebase Console to see your deployment:" -ForegroundColor White
Write-Host "https://console.firebase.google.com/" -ForegroundColor Blue
Write-Host ""

# Return to root directory
Set-Location -Path ".."
