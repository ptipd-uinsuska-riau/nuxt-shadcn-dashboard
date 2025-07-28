# 🎨 Styling Guide

Panduan lengkap untuk styling dan theming dalam Nuxt ShadCN Starter Template menggunakan UnoCSS.

## 🛠️ Tech Stack

- **UnoCSS**: Instant On-demand Atomic CSS engine
- **ShadCN Theme**: Design system dengan CSS variables
- **Tailwind CSS**: Utility-first CSS framework (compatibility)
- **CSS Variables**: Dynamic theming support

## 🎯 UnoCSS Configuration

### Basic Setup

```typescript
// uno.config.ts
import { defineConfig, presetUno, presetAttributify, presetIcons } from 'unocss'
import presetAnimations from 'unocss-preset-animations'
import { presetShadcn } from 'unocss-preset-shadcn'

export default defineConfig({
  presets: [
    presetUno(),
    presetAttributify(),
    presetIcons({
      collections: {
        lucide: () => import('@iconify-json/lucide/icons.json').then(i => i.default),
      }
    }),
    presetAnimations(),
    presetShadcn({
      color: 'slate'
    })
  ],
  content: {
    pipeline: {
      include: [
        /\.(vue|svelte|[jt]sx|mdx?|astro|elm|php|phtml|html)($|\?)/,
        'components/**/*.{vue,js,ts}',
        'layouts/**/*.vue',
        'pages/**/*.vue',
        'composables/**/*.{js,ts}',
        'plugins/**/*.{js,ts}',
        'app.{js,ts,vue}'
      ]
    }
  }
})
```

### Custom Utilities

```typescript
// uno.config.ts
export default defineConfig({
  shortcuts: {
    // Layout shortcuts
    'flex-center': 'flex items-center justify-center',
    'flex-between': 'flex items-center justify-between',
    'absolute-center': 'absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2',
    
    // Button shortcuts
    'btn-base': 'inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:opacity-50 disabled:pointer-events-none ring-offset-background',
    
    // Card shortcuts
    'card-base': 'rounded-lg border bg-card text-card-foreground shadow-sm',
    
    // Input shortcuts
    'input-base': 'flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50'
  },
  
  rules: [
    // Custom rules
    ['text-gradient', {
      'background': 'linear-gradient(45deg, #3b82f6, #8b5cf6)',
      'background-clip': 'text',
      '-webkit-background-clip': 'text',
      '-webkit-text-fill-color': 'transparent'
    }],
    
    // Glass morphism
    ['glass', {
      'backdrop-filter': 'blur(10px)',
      'background': 'rgba(255, 255, 255, 0.1)',
      'border': '1px solid rgba(255, 255, 255, 0.2)'
    }],
    
    // Scrollbar
    ['scrollbar-hide', {
      'scrollbar-width': 'none',
      '-ms-overflow-style': 'none',
      '&::-webkit-scrollbar': {
        'display': 'none'
      }
    }]
  ]
})
```

## 🎨 Color System

### Theme Colors

```css
/* CSS Variables untuk theming */
:root {
  --background: 0 0% 100%;
  --foreground: 222.2 84% 4.9%;
  --card: 0 0% 100%;
  --card-foreground: 222.2 84% 4.9%;
  --popover: 0 0% 100%;
  --popover-foreground: 222.2 84% 4.9%;
  --primary: 221.2 83.2% 53.3%;
  --primary-foreground: 210 40% 98%;
  --secondary: 210 40% 96%;
  --secondary-foreground: 222.2 84% 4.9%;
  --muted: 210 40% 96%;
  --muted-foreground: 215.4 16.3% 46.9%;
  --accent: 210 40% 96%;
  --accent-foreground: 222.2 84% 4.9%;
  --destructive: 0 84.2% 60.2%;
  --destructive-foreground: 210 40% 98%;
  --border: 214.3 31.8% 91.4%;
  --input: 214.3 31.8% 91.4%;
  --ring: 221.2 83.2% 53.3%;
  --radius: 0.5rem;
}

.dark {
  --background: 222.2 84% 4.9%;
  --foreground: 210 40% 98%;
  --card: 222.2 84% 4.9%;
  --card-foreground: 210 40% 98%;
  --popover: 222.2 84% 4.9%;
  --popover-foreground: 210 40% 98%;
  --primary: 217.2 91.2% 59.8%;
  --primary-foreground: 222.2 84% 4.9%;
  --secondary: 217.2 32.6% 17.5%;
  --secondary-foreground: 210 40% 98%;
  --muted: 217.2 32.6% 17.5%;
  --muted-foreground: 215 20.2% 65.1%;
  --accent: 217.2 32.6% 17.5%;
  --accent-foreground: 210 40% 98%;
  --destructive: 0 62.8% 30.6%;
  --destructive-foreground: 210 40% 98%;
  --border: 217.2 32.6% 17.5%;
  --input: 217.2 32.6% 17.5%;
  --ring: 224.3 76.3% 94.1%;
}
```

### Custom Color Palette

```typescript
// uno.config.ts
export default defineConfig({
  theme: {
    colors: {
      // Brand colors
      brand: {
        50: '#eff6ff',
        100: '#dbeafe',
        500: '#3b82f6',
        600: '#2563eb',
        900: '#1e3a8a'
      },
      
      // Status colors
      success: {
        50: '#f0fdf4',
        500: '#22c55e',
        600: '#16a34a'
      },
      
      warning: {
        50: '#fffbeb',
        500: '#f59e0b',
        600: '#d97706'
      },
      
      error: {
        50: '#fef2f2',
        500: '#ef4444',
        600: '#dc2626'
      }
    }
  }
})
```

## 🌙 Dark Mode

### Setup

```vue
<!-- components/ThemeToggle.vue -->
<template>
  <Button variant="ghost" size="icon" @click="toggleTheme">
    <Icon v-if="isDark" name="lucide:sun" class="h-5 w-5" />
    <Icon v-else name="lucide:moon" class="h-5 w-5" />
    <span class="sr-only">Toggle theme</span>
  </Button>
</template>

<script setup>
const colorMode = useColorMode()

const isDark = computed(() => colorMode.value === 'dark')

function toggleTheme() {
  colorMode.preference = isDark.value ? 'light' : 'dark'
}
</script>
```

### Theme Provider

```vue
<!-- app.vue -->
<template>
  <div :class="colorMode.value">
    <div class="min-h-screen bg-background text-foreground">
      <NuxtPage />
    </div>
  </div>
</template>

<script setup>
const colorMode = useColorMode()

// Auto-detect system preference
onMounted(() => {
  if (colorMode.preference === 'system') {
    colorMode.value = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
  }
})
</script>
```

## 🎭 Animations

### Built-in Animations

```vue
<template>
  <div>
    <!-- Fade animations -->
    <div class="animate-fade-in">Fade In</div>
    <div class="animate-fade-out">Fade Out</div>
    
    <!-- Slide animations -->
    <div class="animate-slide-in-left">Slide In Left</div>
    <div class="animate-slide-in-right">Slide In Right</div>
    
    <!-- Scale animations -->
    <div class="animate-scale-in">Scale In</div>
    <div class="animate-bounce">Bounce</div>
    
    <!-- Spin animation -->
    <Icon name="lucide:loader-2" class="animate-spin" />
    
    <!-- Pulse animation -->
    <div class="animate-pulse bg-gray-200 h-4 w-full rounded"></div>
  </div>
</template>
```

### Custom Animations

```typescript
// uno.config.ts
export default defineConfig({
  theme: {
    animation: {
      'fade-in': 'fadeIn 0.5s ease-in-out',
      'slide-up': 'slideUp 0.3s ease-out',
      'scale-in': 'scaleIn 0.2s ease-out',
      'wiggle': 'wiggle 1s ease-in-out infinite'
    },
    keyframes: {
      fadeIn: {
        '0%': { opacity: '0' },
        '100%': { opacity: '1' }
      },
      slideUp: {
        '0%': { transform: 'translateY(100%)', opacity: '0' },
        '100%': { transform: 'translateY(0)', opacity: '1' }
      },
      scaleIn: {
        '0%': { transform: 'scale(0.9)', opacity: '0' },
        '100%': { transform: 'scale(1)', opacity: '1' }
      },
      wiggle: {
        '0%, 100%': { transform: 'rotate(-3deg)' },
        '50%': { transform: 'rotate(3deg)' }
      }
    }
  }
})
```

## 📱 Responsive Design

### Breakpoints

```typescript
// uno.config.ts
export default defineConfig({
  theme: {
    breakpoints: {
      'xs': '475px',
      'sm': '640px',
      'md': '768px',
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1536px'
    }
  }
})
```

### Responsive Utilities

```vue
<template>
  <div>
    <!-- Responsive grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
      <div class="card-base p-4">Card 1</div>
      <div class="card-base p-4">Card 2</div>
      <div class="card-base p-4">Card 3</div>
    </div>
    
    <!-- Responsive text -->
    <h1 class="text-2xl md:text-4xl lg:text-6xl font-bold">
      Responsive Heading
    </h1>
    
    <!-- Responsive spacing -->
    <div class="p-4 md:p-8 lg:p-12">
      Content with responsive padding
    </div>
    
    <!-- Hide/show on different screens -->
    <div class="block md:hidden">Mobile only</div>
    <div class="hidden md:block">Desktop only</div>
  </div>
</template>
```

## 🎨 Component Styling

### Button Variants

```vue
<template>
  <div class="space-x-2">
    <!-- Primary button -->
    <button class="btn-base bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
      Primary
    </button>
    
    <!-- Secondary button -->
    <button class="btn-base bg-secondary text-secondary-foreground hover:bg-secondary/80 h-10 px-4 py-2">
      Secondary
    </button>
    
    <!-- Outline button -->
    <button class="btn-base border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">
      Outline
    </button>
    
    <!-- Ghost button -->
    <button class="btn-base hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">
      Ghost
    </button>
  </div>
</template>
```

### Card Styling

```vue
<template>
  <div class="card-base p-6 space-y-4">
    <div class="space-y-2">
      <h3 class="text-2xl font-semibold leading-none tracking-tight">
        Card Title
      </h3>
      <p class="text-sm text-muted-foreground">
        Card description
      </p>
    </div>
    <div class="space-y-2">
      <p>Card content goes here.</p>
    </div>
    <div class="flex items-center space-x-2">
      <button class="btn-base bg-primary text-primary-foreground hover:bg-primary/90 h-9 px-3">
        Action
      </button>
      <button class="btn-base border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 px-3">
        Cancel
      </button>
    </div>
  </div>
</template>
```

## 🔧 Utility Classes

### Layout

```css
/* Flexbox utilities */
.flex-center { display: flex; align-items: center; justify-content: center; }
.flex-between { display: flex; align-items: center; justify-content: space-between; }
.flex-col-center { display: flex; flex-direction: column; align-items: center; justify-content: center; }

/* Grid utilities */
.grid-auto-fit { grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); }
.grid-auto-fill { grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); }

/* Position utilities */
.absolute-center { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); }
.absolute-center-x { position: absolute; left: 50%; transform: translateX(-50%); }
.absolute-center-y { position: absolute; top: 50%; transform: translateY(-50%); }
```

### Typography

```css
/* Text utilities */
.text-gradient { 
  background: linear-gradient(45deg, #3b82f6, #8b5cf6);
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.text-balance { text-wrap: balance; }
.text-pretty { text-wrap: pretty; }

/* Font utilities */
.font-display { font-family: 'Inter Display', sans-serif; }
.font-mono { font-family: 'JetBrains Mono', monospace; }
```

## 📚 Best Practices

1. **Consistent Spacing**: Gunakan spacing scale yang konsisten (4px, 8px, 16px, 24px, 32px)
2. **Color Contrast**: Pastikan kontras warna memenuhi standar accessibility
3. **Responsive First**: Mulai design dari mobile, kemudian scale up
4. **Component Reusability**: Buat utility classes untuk pattern yang sering digunakan
5. **Performance**: Gunakan UnoCSS untuk generate CSS on-demand
6. **Dark Mode**: Selalu test komponen di light dan dark mode

## 🔗 Resources

- [UnoCSS Documentation](https://unocss.dev/)
- [ShadCN Design System](https://ui.shadcn.com/)
- [Tailwind CSS Documentation](https://tailwindcss.com/)
- [CSS Variables Guide](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties)
