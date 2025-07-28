// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },

  modules: [
    "@unocss/nuxt",
    "shadcn-nuxt",
    "@vueuse/nuxt",
    "@nuxt/eslint",
    "@nuxt/icon",
    "@pinia/nuxt",
    "@nuxtjs/color-mode",
  ],

  css: ["@unocss/reset/tailwind.css"],

  colorMode: {
    classSuffix: "",
  },

  features: {
    // For UnoCSS
    inlineStyles: false,
  },

  eslint: {
    config: {
      standalone: false,
    },
  },

  routeRules: {
    "/components": { redirect: "/components/accordion" },
    "/settings": { redirect: "/settings/profile" },
  },

  imports: {
    dirs: ["./lib"],
  },

  ssr: true,

  vite: {
    optimizeDeps: {
      include: ["@unovis/ts", "@unovis/vue"],
    },
    ssr: {
      noExternal: ["@unovis/ts", "@unovis/vue"],
    },
  },

  compatibilityDate: "2024-12-14",
});
