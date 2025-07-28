# 📤 Instruksi Upload ke GitHub

Repository orang lain telah dihapus dan proyek telah dipersiapkan untuk upload ke repository GitHub Anda sendiri.

## 🚀 Cara Upload (3 Metode)

### **Metode 1: Menggunakan Script Otomatis (Recommended)**

#### Linux/Mac:
```bash
chmod +x upload-to-github.sh
./upload-to-github.sh
```

#### Windows:
```cmd
upload-to-github.bat
```

Script akan meminta URL repository GitHub baru Anda dan otomatis melakukan upload.

---

### **Metode 2: Manual via Terminal**

1. **Buat repository baru di GitHub:**
   - Buka [GitHub](https://github.com)
   - Klik "New repository"
   - Isi nama: `nuxt-shadcn-starter-template` (atau nama lain)
   - Pilih "Public"
   - **JANGAN** centang "Initialize with README"
   - Klik "Create repository"

2. **Upload via terminal:**
   ```bash
   # Ganti URL dengan repository Anda
   git remote add origin https://github.com/USERNAME/REPOSITORY-NAME.git
   git push -u origin main
   ```

---

### **Metode 3: GitHub CLI (jika terinstall)**

```bash
# Login ke GitHub CLI
gh auth login

# Buat repository dan upload sekaligus
gh repo create nuxt-shadcn-starter-template --public --push --source=.
```

---

## ✅ Setelah Upload Berhasil

### **1. Setup sebagai Template Repository**
1. Buka repository di GitHub
2. Klik tab **"Settings"**
3. Scroll ke bagian **"General"**
4. Centang **"Template repository"**
5. Klik **"Save"**

### **2. Setup GitHub Pages (Opsional)**
1. Di Settings, scroll ke **"Pages"**
2. Pilih source: **"GitHub Actions"**
3. Workflow CI/CD akan otomatis deploy

### **3. Update Repository Info**
1. Edit description repository
2. Tambahkan topics/tags: `nuxt3`, `vue3`, `shadcn`, `starter-template`, `typescript`
3. Tambahkan website URL jika ada

---

## 🔧 Troubleshooting

### **Error: "remote origin already exists"**
```bash
git remote remove origin
git remote add origin https://github.com/USERNAME/REPOSITORY-NAME.git
git push -u origin main
```

### **Error: "failed to push"**
- Pastikan repository kosong (tidak ada README, .gitignore, dll)
- Pastikan Anda memiliki akses write ke repository
- Pastikan Git credentials sudah dikonfigurasi

### **Setup Git Credentials (jika belum)**
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

---

## 📋 Checklist Upload

- [ ] Repository baru dibuat di GitHub
- [ ] Repository kosong (tidak ada file default)
- [ ] Git credentials dikonfigurasi
- [ ] Upload berhasil
- [ ] Template repository diaktifkan
- [ ] Description dan topics ditambahkan
- [ ] GitHub Pages setup (opsional)

---

## 🎯 Status Saat Ini

✅ **Remote origin dihapus** - Repository orang lain sudah tidak terhubung  
✅ **Commit baru dibuat** - Semua perubahan template sudah di-commit  
✅ **Working tree clean** - Tidak ada perubahan yang belum di-commit  
✅ **Siap upload** - Proyek siap untuk di-push ke repository baru  

---

## 📞 Bantuan

Jika mengalami masalah:
1. Pastikan Git terinstall: `git --version`
2. Pastikan GitHub credentials sudah setup
3. Coba metode manual jika script otomatis gagal
4. Periksa apakah repository GitHub sudah dibuat dan kosong

**Template Anda siap untuk di-upload! 🚀**
