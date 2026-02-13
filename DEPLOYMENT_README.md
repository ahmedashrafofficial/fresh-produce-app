# 🌿 Fresh Produce App - Deployment Setup Complete!

## ✅ What's Been Set Up

Your Fresh Produce App is now ready for deployment to **Firebase Hosting** (Frontend) and **Azure App Service** (Backend)!

### 📁 Files Created

#### Configuration Files
- ✅ `fresh_produce_ui/.firebaserc` - Firebase project configuration
- ✅ `fresh_produce_ui/firebase.json` - Firebase hosting settings
- ✅ `FreshProduce.Api/appsettings.Production.json.template` - Production config template
- ✅ `fresh_produce_ui/lib/core/constants/app_environment.dart` - Environment configuration

#### Deployment Scripts
- ✅ `deploy-frontend.ps1` - Automated Firebase deployment
- ✅ `deploy-backend.ps1` - Automated Azure deployment

#### CI/CD Workflows
- ✅ `.github/workflows/deploy-frontend.yml` - GitHub Actions for frontend
- ✅ `.github/workflows/deploy-backend.yml` - GitHub Actions for backend

#### Documentation
- ✅ `docs/DEPLOYMENT_GUIDE.md` - Comprehensive deployment guide
- ✅ `DEPLOYMENT_QUICK_REFERENCE.md` - Quick reference card

---

## 🚀 Next Steps

### 1. Install Required Tools

```powershell
# Install Firebase CLI
npm install -g firebase-tools

# Install Azure CLI
# Download from: https://aka.ms/installazurecliwindows
```

### 2. Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project"
3. Name it: `fresh-produce-app`
4. Create the project

### 3. Create Azure Resources

```powershell
# Login to Azure
az login

# Create resource group
az group create --name FreshProduceRG --location eastus

# Create App Service (Free tier)
az appservice plan create --name FreshProducePlan --resource-group FreshProduceRG --sku F1 --is-linux

# Create web app
az webapp create --resource-group FreshProduceRG --plan FreshProducePlan --name fresh-produce-api --runtime "DOTNETCORE:9.0"
```

### 4. Update Configuration

#### Update Firebase Project ID
Edit `fresh_produce_ui/.firebaserc`:
```json
{
  "projects": {
    "default": "YOUR_ACTUAL_FIREBASE_PROJECT_ID"
  }
}
```

#### Create Production Settings
```powershell
# Copy template to actual production file
Copy-Item FreshProduce.Api\appsettings.Production.json.template FreshProduce.Api\appsettings.Production.json

# Edit the file and replace all placeholders:
# - YOUR_AZURE_SQL_CONNECTION_STRING
# - YOUR_SECURE_SECRET_KEY_MINIMUM_32_CHARACTERS
# - YOUR_FIREBASE_PROJECT_ID
```

#### Update Flutter Environment
Edit `fresh_produce_ui/lib/core/constants/app_environment.dart`:
```dart
static const String productionApiUrl = 'https://fresh-produce-api.azurewebsites.net';
```

### 5. Deploy!

#### Deploy Frontend
```powershell
.\deploy-frontend.ps1
```

#### Deploy Backend
```powershell
.\deploy-backend.ps1
```

---

## 📚 Documentation

- **Full Guide:** See `docs/DEPLOYMENT_GUIDE.md` for detailed step-by-step instructions
- **Quick Reference:** See `DEPLOYMENT_QUICK_REFERENCE.md` for common commands

---

## 🔐 Security Notes

⚠️ **IMPORTANT:** The following files contain secrets and are **NOT committed to Git**:
- `FreshProduce.Api/appsettings.Production.json` (actual production settings)
- `FreshProduce.Api/Properties/PublishProfiles/*.pubxml` (Azure publish profiles)

✅ **Safe to commit:**
- `FreshProduce.Api/appsettings.Production.json.template` (template only)
- All other configuration files

---

## 💰 Estimated Costs

| Service | Tier | Monthly Cost |
|---------|------|--------------|
| Firebase Hosting | Free | $0 |
| Azure App Service | F1 (Free) | $0 |
| Azure SQL Database | Basic (Optional) | ~$5 |
| **Total** | | **$0-5** |

---

## 🆘 Need Help?

1. **Read the full guide:** `docs/DEPLOYMENT_GUIDE.md`
2. **Check quick reference:** `DEPLOYMENT_QUICK_REFERENCE.md`
3. **View logs:**
   - Firebase: `firebase hosting:channel:list`
   - Azure: `az webapp log tail --resource-group FreshProduceRG --name fresh-produce-api`

---

## 🎯 Deployment Checklist

Before deploying, make sure you've:

- [ ] Installed Firebase CLI (`npm install -g firebase-tools`)
- [ ] Installed Azure CLI
- [ ] Created Firebase project
- [ ] Created Azure App Service
- [ ] Updated `.firebaserc` with your Firebase project ID
- [ ] Created `appsettings.Production.json` from template
- [ ] Updated production API URL in `app_environment.dart`
- [ ] Updated CORS settings with your Firebase URL
- [ ] Generated a secure JWT secret key
- [ ] Tested locally before deploying

---

**Ready to deploy? Run the deployment scripts and watch your app go live! 🚀**

For questions or issues, refer to the troubleshooting section in `docs/DEPLOYMENT_GUIDE.md`.
