import { themes } from '@/lib/registry/themes'

export function useCustomize() {
  const { value: color } = useColorMode()
  const isDark = color === 'dark'
  const config = useCookie('config', {
    default: () => ({
      theme: 'zinc',
      radius: 0.5,
    }),
  })

  const themeClass = computed(() => `theme-${config.value.theme}`)

  const theme = computed(() => config.value.theme)
  const radius = computed(() => config.value.radius)

  function setTheme(themeName) {
    config.value.theme = themeName
  }

  function setRadius(newRadius) {
    config.value.radius = newRadius
  }

  const themePrimary = computed(() => {
    const t = themes.find(t => t.name === theme.value)
    return `hsl(${
      t?.cssVars[isDark ? 'dark' : 'light'].primary
    })`
  })

  return {
    themeClass,
    theme,
    setTheme,
    radius,
    setRadius,
    themePrimary,
  }
}
