const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: "#3990d2",
        "primary-content": "#ffffff",
        "primary-dark": "#2875b0",
        "primary-light": "#63a7db",
        secondary: "#d24839",
        "secondary-content": "#ffffff",
        "secondary-dark": "#b03528",
        "secondary-light": "#db6e63",
        background: "#eef0f2",
        foreground: "#fbfbfc",
        border: "#dbe0e3",
        copy: "#21272b",
        "copy-light": "#596873",
        "copy-lighter": "#7e8e9b",
        success: "#39d239",
        warning: "#d2d239",
        error: "#d23939",
        "success-content": "#020a02",
        "warning-content": "#0a0a02",
        "error-content": "#ffffff"
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require("daisyui"),
  ],
  daisyui: {
    themes: [
      {
        light: {
          ...require("daisyui/src/theming/themes")["light"],
          primary: "blue",
          secondary: "teal",
        },
      },
    ],
  },
}
