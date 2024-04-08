User.create!(name: "Andy", email: "andy@test.com", password: "password", admin: true)
User.create!(name: "Bob", email: "bob@test.com", password: "password")

Supplier.create!([
  { name: "Hasbro", email: "help@hasbro.com", phone_number: "1234567" },
  { name: "Shark", email: "help@shark.com", phone_number: "7654321" },
])
Product.create!([
  { name: "Shark Vacuum", price: "200.00", description: "A vacuum that is bloodthirsty", inventory: nil, supplier_id: 2 },
  { name: "Silonn Ice Maker", price: "89.00", description: "Fast ice maker!", inventory: nil, supplier_id: 1 },
  { name: "8 Inch Tortilla Press", price: "12.00", description: "Make your own homemade tortillas with this cast aluminum tortilla press!", inventory: nil, supplier_id: 1 },
  { name: "Computer Monitor", price: "150.0", description: "24 inch full HD IPS monitor with thin bezels and 100Hz refresh rate", inventory: nil, supplier_id: 1 },
  { name: "The Rock Blanket", price: "20.00", description: "A very fluffy blanket with Dwayne The Rock Johnson's face on it. Adding more to make this longer", inventory: nil, supplier_id: 1 },
  { name: "cat toy", price: "4.00", description: "toy for your cat. your cat will absolultely love this toy, or maybe not.", inventory: nil, supplier_id: 1 },
])
Image.create!([
  { url: "https://m.media-amazon.com/images/I/61eMsTk4w0L._SX342_.jpg", product_id: 2 },
  { url: "https://m.media-amazon.com/images/I/61ZQP330XLL.__AC_SY300_SX300_QL70_FMwebp_.jpg", product_id: 4 },
  { url: "https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6463/6463068_sd.jpg;maxHeight=640;maxWidth=550", product_id: 5 },
  { url: "https://m.media-amazon.com/images/I/51OvSvgdx+L._AC_SY300_SX300_.jpg", product_id: 5 },
])
