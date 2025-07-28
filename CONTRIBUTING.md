# 🤝 Contributing to Nuxt ShadCN Starter Template

Terima kasih atas minat Anda untuk berkontribusi! Kontribusi dari komunitas sangat membantu dalam membuat template ini lebih baik.

## 📋 Cara Berkontribusi

### 1. Fork Repository

1. Fork repository ini ke akun GitHub Anda
2. Clone fork Anda ke lokal:
   ```bash
   git clone https://github.com/yourusername/nuxt-shadcn-starter-template.git
   cd nuxt-shadcn-starter-template
   ```

### 2. Setup Development Environment

```bash
# Install dependencies
npm install

# Copy environment file
cp .env.example .env

# Start development server
npm run dev
```

### 3. Buat Branch Baru

```bash
# Buat branch untuk fitur/perbaikan Anda
git checkout -b feature/nama-fitur
# atau
git checkout -b fix/nama-bug
```

### 4. Lakukan Perubahan

- Pastikan kode mengikuti style guide yang ada
- Tambahkan tests jika diperlukan
- Update dokumentasi jika diperlukan

### 5. Test Perubahan

```bash
# Jalankan linting
npm run lint

# Jalankan type checking
npm run typecheck

# Test build
npm run build
```

### 6. Commit dan Push

```bash
# Commit dengan pesan yang jelas
git add .
git commit -m "feat: menambahkan fitur baru"

# Push ke fork Anda
git push origin feature/nama-fitur
```

### 7. Buat Pull Request

1. Buka GitHub dan navigasi ke fork Anda
2. Klik "New Pull Request"
3. Isi deskripsi yang jelas tentang perubahan Anda
4. Submit pull request

## 📝 Guidelines

### Commit Messages

Gunakan format conventional commits:

- `feat:` untuk fitur baru
- `fix:` untuk perbaikan bug
- `docs:` untuk perubahan dokumentasi
- `style:` untuk perubahan formatting
- `refactor:` untuk refactoring kode
- `test:` untuk menambah/mengubah tests
- `chore:` untuk maintenance tasks

Contoh:
```
feat: menambahkan komponen navbar baru
fix: memperbaiki responsive design pada mobile
docs: update README dengan instruksi deployment
```

### Code Style

- Gunakan TypeScript untuk type safety
- Ikuti ESLint configuration yang ada
- Gunakan Prettier untuk formatting
- Tulis kode yang clean dan readable
- Tambahkan komentar untuk logic yang kompleks

### Struktur File

```
components/
├── ui/              # Komponen ShadCN UI
├── layout/          # Komponen layout
├── common/          # Komponen umum
└── feature/         # Komponen spesifik fitur

composables/         # Vue composables
├── useAuth.ts
├── useApi.ts
└── ...

pages/              # Halaman aplikasi
├── index.vue
├── about.vue
└── ...
```

## 🐛 Melaporkan Bug

Jika Anda menemukan bug:

1. Cek apakah bug sudah dilaporkan di Issues
2. Jika belum, buat issue baru dengan:
   - Deskripsi jelas tentang bug
   - Langkah untuk reproduce
   - Expected vs actual behavior
   - Screenshot jika diperlukan
   - Environment info (OS, browser, Node version)

## 💡 Mengusulkan Fitur

Untuk mengusulkan fitur baru:

1. Buat issue dengan label "feature request"
2. Jelaskan:
   - Masalah yang ingin diselesaikan
   - Solusi yang diusulkan
   - Alternatif yang sudah dipertimbangkan
   - Mockup/wireframe jika ada

## 📚 Dokumentasi

Bantuan untuk dokumentasi sangat dihargai:

- Perbaiki typo atau grammar
- Tambahkan contoh penggunaan
- Translate ke bahasa lain
- Buat tutorial atau guide

## 🎯 Prioritas Kontribusi

Kami sangat membutuhkan bantuan untuk:

1. **Komponen UI tambahan** - Implementasi komponen ShadCN yang belum ada
2. **Responsive design** - Perbaikan tampilan di berbagai device
3. **Performance optimization** - Optimasi loading dan runtime performance
4. **Accessibility** - Perbaikan a11y compliance
5. **Testing** - Unit tests dan integration tests
6. **Documentation** - Tutorial dan examples

## ❓ Butuh Bantuan?

Jika Anda membutuhkan bantuan:

1. Baca dokumentasi di README.md
2. Cek existing issues dan discussions
3. Buat issue baru dengan label "question"
4. Join Discord/Telegram community (jika ada)

## 🙏 Terima Kasih

Setiap kontribusi, sekecil apapun, sangat berarti bagi komunitas. Terima kasih telah membantu membuat template ini lebih baik!

---

Happy coding! 🚀
