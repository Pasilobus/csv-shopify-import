File.readlines(Rails.root.join('app/assets/redirects.csv')).each do |line, loop|
  list = " "
  product_oldid = " "
  product_handle = " "

  i = i + 1
  break if i == 150555

  l = 0
  array = line.split(",")
  array.each do |word, index|
    l = l + 1
    word = "#{word}"
    if l == 1
      product_oldid = word
    else
      product_handle = word
    end
  end
  puts i
  puts product_handle

  oldpath =  "#{product_oldid}"
  newpath = "#{product_handle}"

  if oldpath.include? "_nmc"
    puts "nmc detected, skip"
  else
    ShopifyAPI::Redirect.create({:path => oldpath , :target => newpath})
  end
end
