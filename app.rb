get '/' do
  # Get JSON filenames
  #@dates = Dir[File.dirname(__FILE__) + '/public/data/*.json'].sort.reverse.first(30).reverse.map { |a| a[/\d{4}-\d{2}-\d{2}(?=\.)/] }.compact
  @dates = Dir[File.dirname(__FILE__) + '/public/data/*.json'].sort.reverse.first(70).reverse.map { |a| a[/\d{4}-\d{2}-\d{2}-\d*(?=\.)/] }.compact
  erb :index
end
