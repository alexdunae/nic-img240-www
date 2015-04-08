set :site_title, 'NIC IMG 240'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

activate :syntax, line_numbers: false

activate :autoprefixer do |config|
  config.browsers = ['> 1%', 'last 4 versions', 'ie 7', 'ie 8', 'ie 9', 'ff 17', 'opera 12.1']
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  set :http_prefix, '/imgd240'
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :rsync
  deploy.host = 'dunae.ca'
  deploy.path = 'dunae.ca/imgd240'
  deploy.user = 'alexdunae'
  # deploy.password = ENV['PASSWORD']
  deploy.clean = false
end
