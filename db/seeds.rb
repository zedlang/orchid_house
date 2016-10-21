#Create an admin user
unless User.exists?(email: "admin@orchidhouse.com")
  u = User.create!(first_name: "Peter", last_name: "Bloggs", email: "admin@orchidhouse.com", password: "password", admin: true)
  u.addresses << Address.new(address1: "The Orchid House", address2: "1 Orchid Street", city: "Cambridge", postcode: "CB1 1ZZ")
end

#Create an ordinary user
unless User.exists?(email: "customer@orchidhouse.com")
  u = User.create!(first_name: "Peter", last_name: "Bloggs", email: "customer@orchidhouse.com", password: "password")
  u.addresses << Address.new(address1: "1 Acacia Avenue", city: "Cambridge", postcode: "CB1 1ZZ")
end

#Create some products
["Phaleonopsis", "Cymbidium", "Dendrobium", "Zygopetalum", "Restrepia", "Vanda", "Coelogyne", "Brassia"].each do |name|
  unless Product.exists?(name: name)
    Product.create!(name: name, price: rand(10..20) + 0.99, quantity: 1 + rand(10))
  end 
end