/** @type {import('tailwindcss').Config} */
const colorPalette = require('./colors/colors.cjs')
module.exports = {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {},
    colors: colorPalette
  },
  plugins: [],
}
