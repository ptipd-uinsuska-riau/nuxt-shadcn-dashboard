# Migration Guide - Mengganti Layout Project Existing

## 📋 Checklist Sebelum Migrasi

- [ ] Backup project existing
- [ ] Commit semua perubahan ke git
- [ ] Catat dependencies yang sudah ada
- [ ] Screenshot layout lama untuk referensi

## 🔧 Langkah Migrasi

### 1. Install Dependencies Baru

```bash
# Install Shadcn Vue dan UnoCSS
npm install @unocss/nuxt shadcn-nuxt @vueuse/nuxt @nuxt/icon @pinia/nuxt @nuxtjs/color-mode

# Install UI dependencies
npm install radix-vue lucide-vue-next @vueuse/core
```

### 2. Update nuxt.config.js

```javascript
export default defineNuxtConfig({
  // Tambahkan modules baru
  modules: [
    '@unocss/nuxt',
    'shadcn-nuxt',
    '@vueuse/nuxt',
    '@nuxt/icon',
    '@pinia/nuxt',
    '@nuxtjs/color-mode',
    // ... modules existing Anda
  ],

  // Tambahkan CSS
  css: [
    '@unocss/reset/tailwind.css',
    // ... CSS existing Anda
  ],

  // Konfigurasi tambahan
  colorMode: {
    classSuffix: '',
  },

  features: {
    inlineStyles: false,
  },

  imports: {
    dirs: [
      './lib',
      // ... dirs existing Anda
    ],
  },
})
```

### 3. Copy File Layout

```bash
# Copy components UI
mkdir -p components/ui
cp -r template/components/ui/* components/ui/

# Copy layout components
mkdir -p components/layout
cp -r template/components/layout/* components/layout/

# Copy lib utilities
mkdir -p lib
cp -r template/lib/* lib/
```

### 4. Update app.vue

```vue
<script setup lang="ts">
// Merge dengan setup existing Anda
import { ConfigProvider } from 'radix-vue'

// ... existing setup code Anda

const useIdFunction = () => useId()
</script>

<template>
  <ConfigProvider :use-id="useIdFunction">
    <div vaul-drawer-wrapper class="relative">
      <NuxtLayout>
        <NuxtPage />
      </NuxtLayout>
    </div>
  </ConfigProvider>
</template>
```

### 5. Update Layout Default

```vue
<!-- layouts/default.vue -->
<script setup lang="ts">
// Merge dengan existing layout logic
</script>

<template>
  <SidebarProvider>
    <LayoutAppSidebar />
    <SidebarInset>
      <LayoutHeader />
      <div class="min-w-0 w-full flex-1 overflow-x-auto p-4 lg:p-6">
        <slot />
      </div>
    </SidebarInset>
  </SidebarProvider>
</template>
```

### 6. Konfigurasi UnoCSS

```javascript
// uno.config.js
import { defineConfig } from 'unocss'
// ... copy dari template

export default defineConfig({
  // ... konfigurasi dari template
})
```

### 7. Update Pages Existing

```vue
<!-- Contoh update page existing -->
<template>
  <div>
    <!-- Wrap konten existing dengan card jika perlu -->
    <Card>
      <CardHeader>
        <CardTitle>{{ title }}</CardTitle>
      </CardHeader>
      <CardContent>
        <!-- Konten existing Anda -->
      </CardContent>
    </Card>
  </div>
</template>

<script setup>
// Import components baru
// ... existing script Anda
</script>
```

## 🔍 Testing Setelah Migrasi

```bash
# 1. Install dependencies
npm install

# 2. Check untuk errors
npm run dev

# 3. Test semua pages
# 4. Test responsive design
# 5. Test dark mode toggle
```

## 🐛 Troubleshooting

### Error: Module not found
```bash
# Install missing dependencies
npm install [missing-package]
```

### Error: CSS conflicts
```bash
# Hapus CSS lama yang conflict
# Update class names sesuai UnoCSS
```

### Error: Component conflicts
```bash
# Rename components yang conflict
# Update imports
```

## 📝 Checklist Post-Migration

- [ ] Semua pages bisa diakses
- [ ] Layout responsive bekerja
- [ ] Dark mode toggle berfungsi
- [ ] Navigation bekerja
- [ ] No console errors
- [ ] Performance masih baik
- [ ] SEO meta tags masih ada

## 🔄 Rollback Plan

Jika ada masalah:

```bash
# Restore dari backup
rm -rf my-project
cp -r my-project-backup my-project

# Atau revert git commits
git reset --hard HEAD~5  # sesuaikan jumlah commits
```