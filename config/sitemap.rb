# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://redwine.nothing.co.nz"

SitemapGenerator::Sitemap.create do |sitemap|
  Wine.find_each do |w|
    sitemap.add wine_path(w), :lastmod => w.updated_at
  end
end
