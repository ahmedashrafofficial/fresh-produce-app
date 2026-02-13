# 🚀 Fresh Produce App - Deployment Quick Reference

## 📦 One-Time Setup

### Install Required Tools
```bash
# Firebase CLI
npm install -g firebase-tools

# Azure CLI
# Download from: https://aka.ms/installazurecliwindows
```

### Login to Services
```bash
# Firebase
firebase login

# Azure
az login
```

---

## 🎯 Deploy Frontend (Firebase)

### Option 1: Using Script (Recommended)
```powershell
.\deploy-frontend.ps1
```

### Option 2: Manual
```bash
cd fresh_produce_ui
flutter build web --release
firebase deploy --only hosting
```

**Your app will be live at:** `https://YOUR_PROJECT_ID.web.app`

---

## ☁️ Deploy Backend (Azure)

### Option 1: Using Script (Recommended)
```powershell
.\deploy-backend.ps1
```

### Option 2: Manual
```bash
dotnet publish FreshProduce.Api/FreshProduce.Api.csproj -c Release -o ./publish
az webapp deployment source config-zip --resource-group FreshProduceRG --name fresh-produce-api --src ./publish.zip
```

**Your API will be live at:** `https://YOUR_APP_NAME.azurewebsites.net`

---

## 🔄 Full Deployment (Both)

```powershell
# Deploy frontend
.\deploy-frontend.ps1

# Deploy backend
.\deploy-backend.ps1
```

---

## 📝 Before First Deployment

### 1. Update Firebase Project ID
Edit `fresh_produce_ui/.firebaserc`:
```json
{
  "projects": {
    "default": "YOUR_ACTUAL_PROJECT_ID"
  }
}
```

### 2. Update Production API URL
Edit `fresh_produce_ui/lib/core/constants/app_environment.dart`:
```dart
static const String productionApiUrl = 'https://YOUR_AZURE_APP.azurewebsites.net';
```

### 3. Update Backend CORS
Edit `FreshProduce.Api/appsettings.Production.json`:
```json
{
  "Cors": {
    "AllowedOrigins": [
      "https://YOUR_PROJECT_ID.web.app",
      "https://YOUR_PROJECT_ID.firebaseapp.com"
    ]
  }
}
```

### 4. Update JWT Secret
Edit `FreshProduce.Api/appsettings.Production.json`:
```json
{
  "JwtSettings": {
    "SecretKey": "YOUR_SECURE_32_CHAR_SECRET_KEY"
  }
}
```

---

## 🔍 Monitoring & Logs

### Frontend Logs
```bash
# View Firebase deployments
firebase hosting:channel:list

# View Firebase console
# https://console.firebase.google.com/
```

### Backend Logs
```bash
# Stream logs
az webapp log tail --resource-group FreshProduceRG --name fresh-produce-api

# Download logs
az webapp log download --resource-group FreshProduceRG --name fresh-produce-api

# View in browser
# https://portal.azure.com/
```

---

## 🐛 Quick Troubleshooting

### Frontend Issues
```bash
# Clear build cache
cd fresh_produce_ui
flutter clean
flutter pub get
flutter build web --release

# Redeploy
firebase deploy --only hosting
```

### Backend Issues
```bash
# Restart Azure app
az webapp restart --resource-group FreshProduceRG --name fresh-produce-api

# View logs
az webapp log tail --resource-group FreshProduceRG --name fresh-produce-api
```

### CORS Errors
- Check `appsettings.Production.json` has correct Firebase URLs
- Redeploy backend after updating CORS settings

---

## 💡 Useful Commands

### Flutter
```bash
flutter doctor              # Check Flutter installation
flutter pub get            # Get dependencies
flutter build web          # Build for web
flutter clean              # Clean build cache
```

### Firebase
```bash
firebase login             # Login
firebase projects:list     # List projects
firebase deploy            # Deploy everything
firebase hosting:disable   # Disable hosting
```

### Azure
```bash
az login                   # Login
az account list            # List subscriptions
az webapp list             # List web apps
az webapp restart          # Restart app
az webapp browse           # Open in browser
```

---

## 📊 Cost Summary

| Service | Tier | Cost |
|---------|------|------|
| Firebase Hosting | Free | $0/month |
| Azure App Service | Free (F1) | $0/month |
| Azure SQL Database | Basic | ~$5/month |
| **Total** | | **~$5/month** |

**Note:** Free tiers have limitations. Upgrade as needed.

---

## 🔗 Important URLs

- **Firebase Console:** https://console.firebase.google.com/
- **Azure Portal:** https://portal.azure.com/
- **GitHub Actions:** https://github.com/YOUR_USERNAME/fresh-produce-app/actions
- **Frontend URL:** https://YOUR_PROJECT_ID.web.app
- **Backend URL:** https://YOUR_APP_NAME.azurewebsites.net
- **Swagger UI:** https://YOUR_APP_NAME.azurewebsites.net/swagger

---

## 📚 Full Documentation

For detailed step-by-step instructions, see: `docs/DEPLOYMENT_GUIDE.md`

---

**Last Updated:** 2026-02-13
