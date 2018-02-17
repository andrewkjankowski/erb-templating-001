class SiteGenerator

  def make_index!
    index = File.open("_site/index.html", 'w')
    index.puts("<!DOCTYPE html><html><head><title>Movies</title></head><body><ul>")
    Movie.all.each do |movie|
      index.puts("<li><a href=\"movies/#{movie.url}\">#{movie.title}</a></li>")
    end
    index.puts("</ul></body></html>")
    index.close()
  end

  def generate_pages!
    Dir.mkdir("_site/movies/") unless File.exists?("_site/movies/")
    renderer = ERB.new(File.read("./lib/templates/movie.html.erb"))
    Movie.all.each do |movie|
      file = File.open("_site/movies/#{movie.url}", 'w')
      file.puts(renderer.result(binding))
      file.close()
    end
  end

end