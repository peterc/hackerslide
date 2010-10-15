get '/' do
  # Get the dates. Be warned, I never said this was good code ;-)
  @dates = Dir[settings.data_root + '/*.json'].sort.reverse.first(72).reverse.map { |a| a[/\d{4}-\d{2}-\d{2}-\d*(?=\.)/] }.compact
  erb :index
end