# 🚀 Deployment Guide

Panduan lengkap untuk deploy aplikasi Nuxt ShadCN Starter Template (JavaScript + Yarn) ke berbagai platform.

## 📋 Persiapan Deployment

### 1. Environment Variables

Pastikan semua environment variables sudah dikonfigurasi:

```bash
# Copy dan edit environment file
cp .env.example .env

# Edit sesuai kebutuhan production
nano .env
```

### 2. Build Test

Test build lokal sebelum deploy:

```bash
# Build untuk production
yarn build

# Test preview
yarn preview
```

### 3. Optimasi

```bash
# Audit dependencies
yarn audit

# Check bundle size
yarn build --analyze
```

## 🌐 Platform Deployment

### Vercel (Recommended)

#### Method 1: Vercel CLI

```bash
# Install Vercel CLI
yarn global add vercel

# Login ke Vercel
vercel login

# Deploy
vercel

# Deploy ke production
vercel --prod
```

#### Method 2: GitHub Integration

1. Push code ke GitHub repository
2. Buka [Vercel Dashboard](https://vercel.com/dashboard)
3. Klik "New Project"
4. Import GitHub repository
5. Configure build settings:
   - **Framework Preset**: Nuxt.js
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`
   - **Install Command**: `npm install`

#### Environment Variables di Vercel

```bash
# Set via CLI
vercel env add NUXT_PUBLIC_APP_URL production
vercel env add DATABASE_URL production

# Atau via dashboard di vercel.com
```

### Netlify

#### Method 1: Netlify CLI

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login
netlify login

# Build dan deploy
npm run generate
netlify deploy --prod --dir=dist
```

#### Method 2: Git Integration

1. Push ke GitHub/GitLab
2. Buka [Netlify Dashboard](https://app.netlify.com/)
3. Klik "New site from Git"
4. Connect repository
5. Configure build settings:
   - **Build command**: `npm run generate`
   - **Publish directory**: `dist`

#### Netlify Configuration

File `netlify.toml` sudah disediakan dengan konfigurasi optimal.

### GitHub Pages

#### Setup GitHub Actions

File `.github/workflows/ci.yml` sudah include deployment ke GitHub Pages.

#### Manual Setup

1. Enable GitHub Pages di repository settings
2. Set source ke "GitHub Actions"
3. Push ke main branch untuk trigger deployment

### Railway

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login
railway login

# Deploy
railway up
```

### Render

1. Connect GitHub repository di [Render Dashboard](https://render.com/)
2. Create new "Web Service"
3. Configure:
   - **Build Command**: `npm run build`
   - **Start Command**: `npm run preview`

### DigitalOcean App Platform

1. Create new app di [DigitalOcean](https://cloud.digitalocean.com/apps)
2. Connect GitHub repository
3. Configure build settings
4. Deploy

## 🐳 Docker Deployment

### Local Docker

```bash
# Build image
docker build -t nuxt-shadcn-app .

# Run container
docker run -p 3000:3000 nuxt-shadcn-app
```

### Docker Compose

```bash
# Development
docker-compose up app-dev

# Production
docker-compose up app
```

### Docker Hub

```bash
# Tag image
docker tag nuxt-shadcn-app yourusername/nuxt-shadcn-app:latest

# Push to Docker Hub
docker push yourusername/nuxt-shadcn-app:latest
```

### Kubernetes

```yaml
# k8s/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nuxt-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nuxt-app
  template:
    metadata:
      labels:
        app: nuxt-app
    spec:
      containers:
        - name: nuxt-app
          image: yourusername/nuxt-shadcn-app:latest
          ports:
            - containerPort: 3000
          env:
            - name: NODE_ENV
              value: "production"
---
apiVersion: v1
kind: Service
metadata:
  name: nuxt-app-service
spec:
  selector:
    app: nuxt-app
  ports:
    - port: 80
      targetPort: 3000
  type: LoadBalancer
```

## ☁️ Cloud Providers

### AWS

#### AWS Amplify

1. Connect GitHub repository
2. Configure build settings
3. Deploy

#### AWS EC2

```bash
# Connect to EC2 instance
ssh -i your-key.pem ubuntu@your-ec2-ip

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Clone repository
git clone https://github.com/yourusername/your-repo.git
cd your-repo

# Install dependencies
npm install

# Build
npm run build

# Install PM2
npm install -g pm2

# Start with PM2
pm2 start npm --name "nuxt-app" -- run preview
pm2 startup
pm2 save
```

### Google Cloud Platform

#### Cloud Run

```bash
# Build and push to Container Registry
gcloud builds submit --tag gcr.io/PROJECT_ID/nuxt-app

# Deploy to Cloud Run
gcloud run deploy --image gcr.io/PROJECT_ID/nuxt-app --platform managed
```

### Azure

#### Azure Static Web Apps

1. Connect GitHub repository
2. Configure build settings
3. Deploy via GitHub Actions

## 🔧 Custom Server

### VPS/Dedicated Server

```bash
# Install dependencies
sudo apt update
sudo apt install nodejs npm nginx

# Clone repository
git clone https://github.com/yourusername/your-repo.git
cd your-repo

# Install dependencies
npm install

# Build
npm run build

# Install PM2
npm install -g pm2

# Start application
pm2 start npm --name "nuxt-app" -- run preview

# Configure Nginx
sudo nano /etc/nginx/sites-available/nuxt-app
```

#### Nginx Configuration

```nginx
server {
    listen 80;
    server_name yourdomain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
```

## 🔒 Security Considerations

### HTTPS Setup

```bash
# Install Certbot
sudo apt install certbot python3-certbot-nginx

# Get SSL certificate
sudo certbot --nginx -d yourdomain.com
```

### Environment Security

- Jangan commit file `.env` ke repository
- Gunakan secrets management untuk production
- Rotate API keys secara berkala
- Enable 2FA untuk deployment platforms

### Security Headers

Headers security sudah dikonfigurasi di `vercel.json` dan `netlify.toml`.

## 📊 Monitoring & Analytics

### Error Tracking

```bash
# Install Sentry
npm install @sentry/nuxt

# Configure in nuxt.config.ts
export default defineNuxtConfig({
  modules: ['@sentry/nuxt/module'],
  sentry: {
    dsn: process.env.SENTRY_DSN
  }
})
```

### Performance Monitoring

- Google Analytics
- Vercel Analytics
- Netlify Analytics
- Custom monitoring solutions

## 🚨 Troubleshooting

### Common Issues

1. **Build Failures**

   ```bash
   # Clear cache
   npm run clean
   npm install
   npm run build
   ```

2. **Environment Variables**

   ```bash
   # Check if variables are loaded
   console.log(process.env.NODE_ENV)
   ```

3. **Memory Issues**
   ```bash
   # Increase Node.js memory
   NODE_OPTIONS="--max-old-space-size=4096" npm run build
   ```

### Deployment Checklist

- [ ] Environment variables configured
- [ ] Build passes locally
- [ ] Tests passing
- [ ] Security headers configured
- [ ] SSL certificate installed
- [ ] Monitoring setup
- [ ] Backup strategy in place
- [ ] Domain configured
- [ ] CDN setup (if needed)

## 📚 Resources

- [Nuxt 3 Deployment](https://nuxt.com/docs/getting-started/deployment)
- [Vercel Documentation](https://vercel.com/docs)
- [Netlify Documentation](https://docs.netlify.com/)
- [Docker Documentation](https://docs.docker.com/)
- [PM2 Documentation](https://pm2.keymetrics.io/docs/)
