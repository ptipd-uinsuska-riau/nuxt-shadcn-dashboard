# 1. Buat branch baru untuk layout migration

git checkout -b layout-migration

# 2. Clone template ke folder terpisah

git clone https://github.com/yourusername/nuxt-shadcn-starter.git temp-template

# 3. Copy file secara selektif

# ... (ikuti langkah di atas)

# 4. Test di branch ini

npm run dev

# 5. Jika berhasil, merge ke main

git checkout main
git merge layout-migration

# 6. Jika gagal, kembali ke main

git checkout main
git branch -D layout-migration
