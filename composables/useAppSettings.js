export function useAppSettings() {
  const { sidebar: _sidebar } = useAppConfig()

  const sidebar = useCookie('app-settings', {
    default: () => ({
      collapsible: _sidebar.collapsible,
      side: _sidebar.side,
      variant: _sidebar.variant,
    }),
  })

  return {
    sidebar,
  }
}
