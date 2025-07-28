# 🚀 Nuxt ShadCN Starter Template

[![Nuxt](https://img.shields.io/badge/Built%20With%20Nuxt-18181B?logo=nuxt.js)](https://nuxt.com/)
[![Vue.js](https://img.shields.io/badge/Vue.js-4FC08D?logo=vue.js&logoColor=white)](https://vuejs.org/)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![Yarn](https://img.shields.io/badge/Yarn-2C8EBB?logo=yarn&logoColor=white)](https://yarnpkg.com/)
[![UnoCSS](https://img.shields.io/badge/UnoCSS-333333?logo=unocss&logoColor=white)](https://unocss.dev/)
[![ShadCN](https://img.shields.io/badge/ShadCN-000000?logo=shadcnui&logoColor=white)](https://ui.shadcn.com/)

> **Template starter modern untuk membangun dashboard dan aplikasi web dengan Nuxt 3, ShadCN Vue, UnoCSS, dan JavaScript**

## ✨ Fitur Utama

- 🎨 **UI Modern** - Komponen ShadCN Vue yang elegan dan responsif
- ⚡ **Performa Tinggi** - Dibangun dengan Nuxt 3 dan UnoCSS untuk performa optimal
- 🟨 **JavaScript** - Modern JavaScript dengan ES6+ features
- 📦 **Yarn Package Manager** - Dependency management yang cepat dan reliable
- 🌙 **Dark Mode** - Dukungan tema gelap/terang otomatis
- 📱 **Responsive** - Desain yang sempurna di semua perangkat
- 🔧 **Developer Friendly** - ESLint, Prettier, dan tools development terbaik
- 🚀 **Production Ready** - Siap deploy ke berbagai platform

## 🛠️ Tech Stack

- **Framework**: [Nuxt 3](https://nuxt.com/)
- **UI Library**: [ShadCN Vue](https://shadcn-vue.com/)
- **Styling**: [UnoCSS](https://unocss.dev/)
- **Icons**: [Lucide Icons](https://lucide.dev/)
- **State Management**: [Pinia](https://pinia.vuejs.org/)
- **Form Validation**: [VeeValidate](https://vee-validate.logaretm.com/v4/) + [Zod](https://zod.dev/)
- **JavaScript**: Modern ES6+ dengan JSDoc untuk dokumentasi

## 📋 Persyaratan Sistem

- **Node.js** 18.0.0 atau lebih tinggi
- **Yarn** 1.22.0 atau lebih tinggi (recommended package manager)

## 🚀 Quick Start

### Metode 1: Menggunakan Template (Recommended)

```bash
# Gunakan template ini untuk membuat proyek baru
npx degit yourusername/nuxt-shadcn-starter-template my-awesome-app
cd my-awesome-app

# Jalankan setup otomatis
yarn setup
# atau untuk Windows: yarn setup:win

# Mulai development server
yarn dev
```

### Metode 2: Clone Repository

```bash
# Clone repository
git clone https://github.com/yourusername/nuxt-shadcn-starter-template.git
cd nuxt-shadcn-starter-template

# Install dependencies
yarn install

# Copy environment file
cp .env.example .env

# Mulai development server
yarn dev
```

Buka [http://localhost:3000](http://localhost:3000) di browser Anda.

## 📁 Struktur Proyek

```
nuxt-shadcn-starter-template/
├── components/           # Komponen Vue
│   ├── ui/              # Komponen ShadCN UI
│   ├── layout/          # Komponen layout
│   └── ...
├── composables/         # Vue composables
├── layouts/             # Layout Nuxt
├── pages/               # Halaman aplikasi
├── public/              # Asset statis
├── server/              # Server-side code
├── lib/                 # Utility functions dan helpers
├── .env.example         # Template environment variables
├── nuxt.config.js       # Konfigurasi Nuxt
├── uno.config.js        # Konfigurasi UnoCSS
├── jsconfig.json        # JavaScript configuration
└── package.json
```

## 🔧 Konfigurasi Environment

1. Copy file `.env.example` ke `.env`:

   ```bash
   cp .env.example .env
   ```

2. Edit file `.env` sesuai kebutuhan:

   ```env
   # Application settings
   NUXT_PUBLIC_APP_NAME="My Awesome App"
   NUXT_PUBLIC_APP_URL="http://localhost:3000"

   # Database (jika diperlukan)
   DATABASE_URL="your-database-url"

   # Authentication (jika diperlukan)
   JWT_SECRET="your-jwt-secret"
   ```

## 📜 Available Scripts

```bash
# Development
yarn dev             # Mulai development server
yarn build           # Build untuk production
yarn preview         # Preview production build
yarn generate        # Generate static site

# Code Quality
yarn lint            # Jalankan ESLint
yarn format          # Format code dengan ESLint

# Setup
yarn setup           # Setup otomatis (Linux/Mac)
yarn setup:win       # Setup otomatis (Windows)

# Maintenance
yarn clean           # Bersihkan build artifacts
yarn clean:all       # Bersihkan semua termasuk node_modules
yarn update-deps     # Update dependencies
```

## 🎨 Kustomisasi

### Menambah Komponen Baru

```bash
# Tambah komponen ShadCN
npx shadcn-vue@latest add button
npx shadcn-vue@latest add card
npx shadcn-vue@latest add dialog
```

### Mengubah Tema

Edit file `uno.config.js` untuk mengubah tema:

```javascript
export default defineConfig({
  theme: {
    colors: {
      primary: {
        50: "#eff6ff",
        500: "#3b82f6",
        900: "#1e3a8a",
      },
    },
  },
});
```

## 📤 Tutorial Upload ke GitHub

### 1. Persiapan Repository

1. **Buat repository baru di GitHub**:
   - Buka [GitHub](https://github.com)
   - Klik tombol "New repository"
   - Isi nama repository (contoh: `my-awesome-dashboard`)
   - Pilih "Public" atau "Private"
   - **JANGAN** centang "Initialize with README"
   - Klik "Create repository"

### 2. Upload Proyek ke GitHub

```bash
# 1. Inisialisasi Git (jika belum)
git init

# 2. Tambahkan semua file
git add .

# 3. Commit pertama
git commit -m "🎉 Initial commit: My awesome dashboard"

# 4. Tambahkan remote origin (ganti dengan URL repository Anda)
git remote add origin https://github.com/username/repository-name.git

# 5. Push ke GitHub
git branch -M main
git push -u origin main
```

### 3. Setup GitHub Pages (Opsional)

Untuk deploy otomatis ke GitHub Pages:

1. Buat file `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: "18"
          cache: "npm"

      - name: Install dependencies
        run: yarn install --frozen-lockfile

      - name: Build
        run: yarn generate

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./dist
```

2. Aktifkan GitHub Pages di repository settings

## 🚀 Deployment

### Vercel (Recommended)

1. **Connect ke Vercel**:

   ```bash
   # Install Vercel CLI
   yarn global add vercel

   # Deploy
   vercel
   ```

2. **Atau deploy via Vercel Dashboard**:
   - Buka [Vercel](https://vercel.com)
   - Import repository GitHub Anda
   - Deploy otomatis akan berjalan

### Netlify

1. **Deploy via Netlify CLI**:

   ```bash
   # Install Netlify CLI
   yarn global add netlify-cli

   # Build project
   yarn generate

   # Deploy
   netlify deploy --prod --dir=dist
   ```

2. **Atau deploy via Netlify Dashboard**:
   - Buka [Netlify](https://netlify.com)
   - Drag & drop folder `dist` hasil build

### Docker

```dockerfile
# Dockerfile
FROM node:18-alpine

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production && yarn cache clean
COPY . .
RUN yarn build

EXPOSE 3000
CMD ["npm", "run", "preview"]
```

```bash
# Build dan run Docker container
docker build -t my-nuxt-app .
docker run -p 3000:3000 my-nuxt-app
```

## 🤝 Contributing

Kontribusi sangat diterima! Silakan:

1. Fork repository ini
2. Buat branch fitur (`git checkout -b feature/amazing-feature`)
3. Commit perubahan (`git commit -m 'Add amazing feature'`)
4. Push ke branch (`git push origin feature/amazing-feature`)
5. Buat Pull Request

## 📝 Changelog

### v1.0.0

- ✨ Initial release
- 🎨 ShadCN Vue components
- ⚡ UnoCSS integration
- 🌙 Dark mode support
- 📱 Responsive design

## 🐛 Troubleshooting

### Error: "Cannot resolve dependency"

```bash
# Hapus node_modules dan install ulang
rm -rf node_modules yarn.lock
yarn install
```

### Error: "Port 3000 already in use"

```bash
# Gunakan port lain
yarn dev --port 3001
```

### Build error di production

```bash
# Pastikan semua dependencies terinstall
yarn install --frozen-lockfile
yarn lint
yarn build
```

## 📚 Resources

- [Nuxt 3 Documentation](https://nuxt.com/docs)
- [ShadCN Vue Documentation](https://shadcn-vue.com/)
- [UnoCSS Documentation](https://unocss.dev/)
- [Vue 3 Documentation](https://vuejs.org/)
- [JavaScript Documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
- [Yarn Documentation](https://yarnpkg.com/)

## 📄 License

MIT License - lihat file [LICENSE](LICENSE) untuk detail.

## 🙏 Credits

Template ini dibuat berdasarkan:

- [Nuxt 3](https://nuxt.com/) - The Intuitive Vue Framework
- [ShadCN Vue](https://shadcn-vue.com/) - Beautiful UI components
- [UnoCSS](https://unocss.dev/) - Instant On-demand Atomic CSS
- [Original Dashboard](https://github.com/dianprata/nuxt-shadcn-dashboard) by Dian Pratama

---

<div align="center">
  <p>Dibuat dengan ❤️ untuk komunitas developer Indonesia</p>
  <p>
    <a href="https://github.com/yourusername/nuxt-shadcn-starter-template">⭐ Star repository ini jika bermanfaat!</a>
  </p>
</div>
