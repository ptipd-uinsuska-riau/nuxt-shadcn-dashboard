# 1. Clone template ke folder terpisah

git clone https://github.com/yourusername/nuxt-shadcn-starter.git temp-template
cd temp-template

# 2. Copy hanya file layout yang dibutuhkan

cp -r components/layout/ ../my-existing-project/components/
cp -r components/ui/ ../my-existing-project/components/
cp layouts/ ../my-existing-project/layouts/
cp app.vue ../my-existing-project/

# 3. Copy konfigurasi (hati-hati, cek dulu!)

cp nuxt.config.js ../my-existing-project/nuxt.config.js.new
cp uno.config.js ../my-existing-project/uno.config.js.new

# 4. Hapus folder temporary

cd ..
rm -rf temp-template
