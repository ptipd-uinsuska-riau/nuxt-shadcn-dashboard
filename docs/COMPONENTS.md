# 🧩 Components Guide

Panduan lengkap untuk menggunakan dan mengkustomisasi komponen dalam Nuxt ShadCN Starter Template.

## 📁 Struktur Komponen

```
components/
├── ui/                 # ShadCN UI Components
│   ├── button/
│   ├── card/
│   ├── dialog/
│   ├── input/
│   └── ...
├── layout/            # Layout Components
│   ├── Header.vue
│   ├── Sidebar.vue
│   ├── Footer.vue
│   └── Navigation.vue
├── common/            # Common Components
│   ├── Loading.vue
│   ├── ErrorBoundary.vue
│   └── NotFound.vue
└── feature/           # Feature-specific Components
    ├── auth/
    ├── dashboard/
    └── settings/
```

## 🎨 ShadCN UI Components

### Installation

Tambah komponen ShadCN baru:

```bash
# Install komponen individual
npx shadcn-vue@latest add button
npx shadcn-vue@latest add card
npx shadcn-vue@latest add dialog
npx shadcn-vue@latest add input
npx shadcn-vue@latest add table

# Install multiple components
npx shadcn-vue@latest add button card dialog input
```

### Available Components

#### Button

```vue
<template>
  <div class="space-x-2">
    <!-- Default button -->
    <Button>Default</Button>
    
    <!-- Variants -->
    <Button variant="destructive">Destructive</Button>
    <Button variant="outline">Outline</Button>
    <Button variant="secondary">Secondary</Button>
    <Button variant="ghost">Ghost</Button>
    <Button variant="link">Link</Button>
    
    <!-- Sizes -->
    <Button size="sm">Small</Button>
    <Button size="lg">Large</Button>
    
    <!-- With icon -->
    <Button>
      <Icon name="lucide:plus" class="mr-2 h-4 w-4" />
      Add Item
    </Button>
    
    <!-- Loading state -->
    <Button :disabled="loading">
      <Icon v-if="loading" name="lucide:loader-2" class="mr-2 h-4 w-4 animate-spin" />
      {{ loading ? 'Loading...' : 'Submit' }}
    </Button>
  </div>
</template>
```

#### Card

```vue
<template>
  <Card class="w-[350px]">
    <CardHeader>
      <CardTitle>Card Title</CardTitle>
      <CardDescription>Card description goes here</CardDescription>
    </CardHeader>
    <CardContent>
      <p>Card content</p>
    </CardContent>
    <CardFooter class="flex justify-between">
      <Button variant="outline">Cancel</Button>
      <Button>Save</Button>
    </CardFooter>
  </Card>
</template>
```

#### Dialog

```vue
<template>
  <Dialog v-model:open="isOpen">
    <DialogTrigger as-child>
      <Button>Open Dialog</Button>
    </DialogTrigger>
    <DialogContent class="sm:max-w-[425px]">
      <DialogHeader>
        <DialogTitle>Edit Profile</DialogTitle>
        <DialogDescription>
          Make changes to your profile here. Click save when you're done.
        </DialogDescription>
      </DialogHeader>
      <div class="grid gap-4 py-4">
        <div class="grid grid-cols-4 items-center gap-4">
          <Label for="name" class="text-right">Name</Label>
          <Input id="name" v-model="name" class="col-span-3" />
        </div>
      </div>
      <DialogFooter>
        <Button type="submit" @click="save">Save changes</Button>
      </DialogFooter>
    </DialogContent>
  </Dialog>
</template>

<script setup>
const isOpen = ref(false)
const name = ref('')

function save() {
  // Save logic here
  isOpen.value = false
}
</script>
```

#### Form Components

```vue
<template>
  <form @submit="onSubmit" class="space-y-6">
    <!-- Input Field -->
    <div class="space-y-2">
      <Label for="email">Email</Label>
      <Input
        id="email"
        v-model="email"
        type="email"
        placeholder="Enter your email"
        :class="{ 'border-red-500': errors.email }"
      />
      <p v-if="errors.email" class="text-sm text-red-500">
        {{ errors.email }}
      </p>
    </div>

    <!-- Select -->
    <div class="space-y-2">
      <Label for="country">Country</Label>
      <Select v-model="country">
        <SelectTrigger>
          <SelectValue placeholder="Select a country" />
        </SelectTrigger>
        <SelectContent>
          <SelectItem value="us">United States</SelectItem>
          <SelectItem value="id">Indonesia</SelectItem>
          <SelectItem value="sg">Singapore</SelectItem>
        </SelectContent>
      </Select>
    </div>

    <!-- Checkbox -->
    <div class="flex items-center space-x-2">
      <Checkbox id="terms" v-model="acceptTerms" />
      <Label for="terms">Accept terms and conditions</Label>
    </div>

    <!-- Submit Button -->
    <Button type="submit" class="w-full">
      Submit
    </Button>
  </form>
</template>

<script setup>
import { z } from 'zod'

const schema = z.object({
  email: z.string().email(),
  country: z.string().min(1),
  acceptTerms: z.boolean().refine(val => val === true)
})

const { handleSubmit, errors } = useForm({
  validationSchema: toTypedSchema(schema)
})

const email = ref('')
const country = ref('')
const acceptTerms = ref(false)

const onSubmit = handleSubmit((values) => {
  console.log('Form submitted:', values)
})
</script>
```

## 🎯 Custom Components

### Loading Component

```vue
<!-- components/common/Loading.vue -->
<template>
  <div class="flex items-center justify-center p-8">
    <div class="flex items-center space-x-2">
      <Icon name="lucide:loader-2" class="h-6 w-6 animate-spin" />
      <span v-if="message">{{ message }}</span>
    </div>
  </div>
</template>

<script setup>
interface Props {
  message?: string
}

withDefaults(defineProps<Props>(), {
  message: 'Loading...'
})
</script>
```

### Error Boundary

```vue
<!-- components/common/ErrorBoundary.vue -->
<template>
  <div v-if="error" class="rounded-lg border border-red-200 bg-red-50 p-4">
    <div class="flex">
      <Icon name="lucide:alert-circle" class="h-5 w-5 text-red-400" />
      <div class="ml-3">
        <h3 class="text-sm font-medium text-red-800">
          Something went wrong
        </h3>
        <div class="mt-2 text-sm text-red-700">
          <p>{{ error.message }}</p>
        </div>
        <div class="mt-4">
          <Button variant="outline" size="sm" @click="retry">
            Try again
          </Button>
        </div>
      </div>
    </div>
  </div>
  <slot v-else />
</template>

<script setup>
interface Props {
  error?: Error | null
}

const props = withDefaults(defineProps<Props>(), {
  error: null
})

const emit = defineEmits<{
  retry: []
}>()

function retry() {
  emit('retry')
}
</script>
```

### Data Table

```vue
<!-- components/common/DataTable.vue -->
<template>
  <div class="space-y-4">
    <!-- Search -->
    <div class="flex items-center justify-between">
      <Input
        v-model="searchQuery"
        placeholder="Search..."
        class="max-w-sm"
      />
      <Button @click="refresh">
        <Icon name="lucide:refresh-cw" class="mr-2 h-4 w-4" />
        Refresh
      </Button>
    </div>

    <!-- Table -->
    <div class="rounded-md border">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead
              v-for="column in columns"
              :key="column.key"
              :class="column.class"
            >
              {{ column.label }}
            </TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          <TableRow v-for="item in filteredData" :key="item.id">
            <TableCell
              v-for="column in columns"
              :key="column.key"
              :class="column.class"
            >
              <slot
                :name="`cell-${column.key}`"
                :item="item"
                :value="item[column.key]"
              >
                {{ item[column.key] }}
              </slot>
            </TableCell>
          </TableRow>
        </TableBody>
      </Table>
    </div>

    <!-- Pagination -->
    <div class="flex items-center justify-between">
      <p class="text-sm text-muted-foreground">
        Showing {{ startIndex }} to {{ endIndex }} of {{ total }} results
      </p>
      <div class="flex items-center space-x-2">
        <Button
          variant="outline"
          size="sm"
          :disabled="currentPage === 1"
          @click="previousPage"
        >
          Previous
        </Button>
        <Button
          variant="outline"
          size="sm"
          :disabled="currentPage === totalPages"
          @click="nextPage"
        >
          Next
        </Button>
      </div>
    </div>
  </div>
</template>

<script setup>
interface Column {
  key: string
  label: string
  class?: string
}

interface Props {
  data: any[]
  columns: Column[]
  pageSize?: number
}

const props = withDefaults(defineProps<Props>(), {
  pageSize: 10
})

const emit = defineEmits<{
  refresh: []
}>()

const searchQuery = ref('')
const currentPage = ref(1)

const filteredData = computed(() => {
  let filtered = props.data

  if (searchQuery.value) {
    filtered = filtered.filter(item =>
      Object.values(item).some(value =>
        String(value).toLowerCase().includes(searchQuery.value.toLowerCase())
      )
    )
  }

  const start = (currentPage.value - 1) * props.pageSize
  const end = start + props.pageSize
  return filtered.slice(start, end)
})

const total = computed(() => props.data.length)
const totalPages = computed(() => Math.ceil(total.value / props.pageSize))
const startIndex = computed(() => (currentPage.value - 1) * props.pageSize + 1)
const endIndex = computed(() => Math.min(currentPage.value * props.pageSize, total.value))

function previousPage() {
  if (currentPage.value > 1) {
    currentPage.value--
  }
}

function nextPage() {
  if (currentPage.value < totalPages.value) {
    currentPage.value++
  }
}

function refresh() {
  emit('refresh')
}
</script>
```

## 🎨 Styling & Theming

### Custom Variants

```typescript
// lib/utils.ts
import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

// Custom button variants
export const buttonVariants = cva(
  'inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:opacity-50 disabled:pointer-events-none ring-offset-background',
  {
    variants: {
      variant: {
        default: 'bg-primary text-primary-foreground hover:bg-primary/90',
        destructive: 'bg-destructive text-destructive-foreground hover:bg-destructive/90',
        outline: 'border border-input hover:bg-accent hover:text-accent-foreground',
        secondary: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        ghost: 'hover:bg-accent hover:text-accent-foreground',
        link: 'underline-offset-4 hover:underline text-primary',
        // Custom variants
        success: 'bg-green-600 text-white hover:bg-green-700',
        warning: 'bg-yellow-600 text-white hover:bg-yellow-700',
      },
      size: {
        default: 'h-10 py-2 px-4',
        sm: 'h-9 px-3 rounded-md',
        lg: 'h-11 px-8 rounded-md',
        icon: 'h-10 w-10',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
    },
  }
)
```

### Dark Mode

```vue
<template>
  <div>
    <!-- Dark mode toggle -->
    <Button variant="ghost" size="icon" @click="toggleDarkMode">
      <Icon v-if="isDark" name="lucide:sun" class="h-5 w-5" />
      <Icon v-else name="lucide:moon" class="h-5 w-5" />
    </Button>
  </div>
</template>

<script setup>
const colorMode = useColorMode()

const isDark = computed(() => colorMode.value === 'dark')

function toggleDarkMode() {
  colorMode.preference = isDark.value ? 'light' : 'dark'
}
</script>
```

## 📚 Best Practices

1. **Component Composition**: Gunakan composition pattern untuk reusability
2. **Props Validation**: Selalu define props dengan TypeScript interfaces
3. **Event Handling**: Gunakan emit untuk komunikasi parent-child
4. **Accessibility**: Implement proper ARIA attributes
5. **Performance**: Gunakan lazy loading untuk komponen besar
6. **Testing**: Write unit tests untuk komponen kritis

## 🔗 Resources

- [ShadCN Vue Documentation](https://shadcn-vue.com/)
- [Radix Vue Primitives](https://radix-vue.com/)
- [Vue 3 Composition API](https://vuejs.org/guide/extras/composition-api-faq.html)
- [UnoCSS Documentation](https://unocss.dev/)
