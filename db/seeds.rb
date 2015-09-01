roles = Role.create([
  {title: 'admin'},
  {title: 'user'}
]) if Role.count == 0

payments = Payment.create([
  {type_of_paiment: 'cash payment'}
]) if Payment.count == 0

categories = []
categories << Category.create(category: "Monitors")
categories << Category.create(category: "Processors")
categories << Category.create(category: "Motherboards")
categories << Category.create(category: "Memory")
categories << Category.create(category: "Keyboards")

categories.each do |category|
  1.upto(40) do |n|
    Product.create(name: "#{category.category} #{n}",
                 description: "Best #{category.category} #{n}!!!",
                 category_id: category.id,
                 price: n * 120.35,
                 available: true)
  end
end
