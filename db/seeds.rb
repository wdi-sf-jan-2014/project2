# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

r1 = Restaurant.create(name: "McDonalds")
r2 = Restaurant.create(name: "Panera")
r3 = Restaurant.create(name: "The Melt")
r4 = Restaurant.create(name: "Starbucks")
r5 = Restaurant.create(name: "Zeke's")

f1 = Funcheap.create(event: "concert")
f2 = Funcheap.create(event: "movie")
f3 = Funcheap.create(event: "bowling")
f4 = Funcheap.create(event: "dancing")
f5 = Funcheap.create(event: "hiking")

i1 = Itinerary.create(date: "02-23-2014")
i2 = Itinerary.create(date: "02-24-2014")
i3 = Itinerary.create(date: "02-25-2014")
i4 = Itinerary.create(date: "02-26-2014")
i5 = Itinerary.create(date: "02-27-2014")

i1.restaurants << r1
i1.funcheaps << f1
i1.funcheaps << f2 

i2.restaurants << r2
i2.funcheaps << f1
i2.funcheaps << f3

i3.restaurants << r3
i3.restaurants << r4
i3.funcheaps << f3
i3.funcheaps << f4

i4.restaurants << r4
i4.funcheaps << f1
i4.funcheaps << f3
i4.funcheaps << f5

i5.restaurants << r2
i5.restaurants << r4
i5.restaurants << r5
i5.funcheaps << f1
i5.funcheaps << f3
i5.funcheaps << f5

