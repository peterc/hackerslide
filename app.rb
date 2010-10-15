get '/' do
  # Get the dates
  @dates = Dir[settings.data_root + '/*.json'].sort.reverse.first(70).reverse.map { |a| a[/\d{4}-\d{2}-\d{2}-\d*(?=\.)/] }.compact
  erb :index
end