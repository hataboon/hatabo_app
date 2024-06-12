module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      backgroundImage: {
        'back_image': "url('/assets/top_back/back_image.jpg')"
      }
    }
  },
  plugins: [require("daisyui")],
}
