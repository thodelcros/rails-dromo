# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying all database..."

Itinary.destroy_all
Users.destroy_all


puts "creating users..."

jeremy = User.create!(name: "jeremyls", email: "jeremy@email.com", password: "azerty", photo: File.open(Rails.root.join("db/fixtures/users/......")), description: "")
thomas = User.create!(name: "thomasd", email: "thomas@email.com", password: "azerty", photo: File.open(Rails.root.join("db/fixtures/users/......")), description: "")
renaud = User.create!(name: "renauds", email: "renaud@email.com", password: "azerty", photo: File.open(Rails.root.join("db/fixtures/users/......")), description: "")
camille = User.create!(name: "camillelb", email: "camille@email.com", password: "azerty", photo: File.open(Rails.root.join("db/fixtures/users/......")), description: "")

puts "creating itinaries..."

puts "Creating first itinary for user #{camille.name}..."

itinary1 = Itinary.create!(
  owner: camille,
  duration: 60,
  country: 'Argentina',
  transportation: 'bus',
  start_date: Date.new(2017, 8, 12),
  crew: 'couple',
  shared: true
)

step1 = Step.create!(
  itinerary: itinary1,
  title: 'Buenos Aires La Boca',
  description: 'We loved the colored streets of this neiborghood of Buenos Aires, this is THE neiborghood of Maradona!',
  category: 'vantage point',
  city: 'Buenos Aires',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-2.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-3.png.")), step: step1)

step2 = Step.create!(
  itinerary: itinary1,
  title: 'Bahia Blanca party !',
  description: 'Wonderful seaside resort to party on the beach and meet young Argentineans',
  category: 'party',
  city: 'Bahia Blanca',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step3 = Step.create!(
  itinerary: itinary1,
  title: 'El Condor',
  description: 'Thousands of parrots clinging to cliffs, very impressive.',
  category: 'vantage point',
  city: 'El Condor',
  rating: 3
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step4 = Step.create!(
  itinerary: itinary1,
  title: 'Peninsula Valdes',
  description: 'Orcas attack on the beach, amazing !',
  category: 'nature',
  city: 'Puerto Madryn',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)



puts "Creating first itinary for user #{jeremy.name}..."


itinary2 = Itinary.create!(
  owner: jeremy,
  duration: 30,
  country: 'Argentina',
  transportation: 'bus',
  start_date: Date.new(2017, 2, 20),
  crew: 'solo',
  shared: true
)

step1 = Step.create!(
  itinerary: itinary2,
  title: 'Rio Gallegos',
  description: 'Last city of Argentina before the Tierra del Fuego, it was great to meet some people with whom to start this long trip in the Tierra del Fuego!',
  category: 'party',
  city: 'Rio Gallegos',
  rating: 3
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-2.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-3.png.")), step: step1)

step2 = Step.create!(
  itinerary: itinary2,
  title: 'Rio Grande',
  description: 'Industrial city of Tierra del Fuego, do not bother to stay more than one night!',
  category: 'vantage point',
  city: 'Rio Grande',
  rating: 1
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step3 = Step.create!(
  itinerary: itinary2,
  title: 'Tolhuin',
  description: 'Cute town in the center of the Tierra del Fuego, nice to chill with friends a week.',
  category: 'vantage point',
  city: 'Tolhuin',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step4 = Step.create!(
  itinerary: itinary2,
  title: 'Ushuaïa',
  description: 'Mythical city surfing on its status of city of "the world\'s end", the train of the end of the world is a must!',
  category: 'nature',
  city: 'Ushuaïa',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step5 = Step.create!(
  itinerary: itinary2,
  title: 'Parque national Tierra del Fuego',
  description: 'The park tours are really cool! Great to spend two or three days there.',
  category: 'sport',
  city: 'Ushuaïa',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)


puts "Creating first itinary for user #{camille.name}..."


itinary3 = Itinary.create!(
  owner: camille,
  duration: 20,
  country: 'Argentina',
  transportation: 'bus',
  start_date: Date.new(2018, 3, 7),
  crew: 'couple',
  shared: true
)

step1 = Step.create!(
  itinerary: itinary3,
  title: 'Torres del Paine',
  description: 'Huge mountains and light blue icebergs. Amazing!',
  category: 'nature',
  city: 'Cancha Carrera',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-2.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-3.png.")), step: step1)

step2 = Step.create!(
  itinerary: itinary3,
  title: 'El Calafate Glaciarium',
  description: 'Very interesting museum to introduce all the glaciers in the area',
  category: 'vantage point',
  city: 'El Calafate',
  rating: 3
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step3 = Step.create!(
  itinerary: itinary3,
  title: 'Restaurante Ahonikenk El Chaltén',
  description: 'Super restaurant in a small wooden cabin.',
  category: 'food',
  city: 'El Chaltén',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step4 = Step.create!(
  itinerary: itinary3,
  title: 'Perito Moreno',
  description: 'A breathtaking view of the most mythical glacier in the world!!',
  category: 'vantage point',
  city: 'Punta Bandera',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)


puts "Creating first itinary for user #{thomas.name}..."


itinary4 = Itinary.create!(
  owner: thomas,
  duration: 20,
  country: 'Argentina',
  transportation: 'bus',
  start_date: Date.new(2017, 4, 18),
  crew: 'family',
  shared: true
)

step1 = Step.create!(
  itinerary: itinary4,
  title: 'El Bolsón',
  description: 'A very picturesque little village, ideal for staying there for several days.',
  category: 'nature',
  city: 'El Bolsón',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-2.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-3.png.")), step: step1)

step2 = Step.create!(
  itinerary: itinary4,
  title: 'Parque national Nahuel Huapi',
  description: 'The most beautiful park in the world, my favorite!',
  category: 'vantage point',
  city: 'San Carlos Bariloche',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step3 = Step.create!(
  itinerary: itinary4,
  title: 'San Martín de los Andes',
  description: 'Small tourist town, top to relax!',
  category: 'nature',
  city: 'San Martín',
  rating: 3
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step4 = Step.create!(
  itinerary: itinary4,
  title: 'Mendoza',
  description: 'Great restaurant, ideal for drinking the best Argentine wines and eating an asado!',
  category: 'food',
  city: 'Mendoza',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step5 = Step.create!(
  itinerary: itinary4,
  title: 'Pueblo Estancia La Paz',
  description: 'Very relaxing hotel belonging to the former Argentine president. Great but not cheap!',
  category: 'housing',
  city: 'Cordoba',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)


puts "Creating first itinary for user #{jeremy.name}..."


itinary5 = Itinary.create!(
  owner: jeremy,
  duration: 15,
  country: 'Argentina',
  transportation: 'bus',
  start_date: Date.new(2018, 7, 3),
  crew: 'solo',
  shared: true
)

step1 = Step.create!(
  itinerary: itinary5,
  title: 'Parque Provincial Ischigualasto',
  description: 'It looks like the moon!',
  category: 'nature',
  city: 'Amana',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-2.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-3.png.")), step: step1)

step2 = Step.create!(
  itinerary: itinary5,
  title: 'El Cafayate',
  description: 'The famous seven-color mountain!',
  category: 'vantage point',
  city: 'El Cafayate',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step3 = Step.create!(
  itinerary: itinary5,
  title: 'National Park Los Cardones',
  description: 'Cactus more than 10 meters long and several hundred years old. It\'s awesome!',
  category: 'nature',
  city: 'Jujuy',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step4 = Step.create!(
  itinerary: itinary5,
  title: 'Salta La Linda',
  description: 'Salta La Linda, great place to party and meet other travelers before Bolivia!',
  category: 'party',
  city: 'Salta',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)


puts "Creating first itinary for user #{renaud.name}..."


itinary6 = Itinary.create!(
  owner: renaud,
  duration: 7,
  country: 'Argentina',
  transportation: 'bus',
  start_date: Date.new(2017, 11, 20),
  crew: 'family',
  shared: true
)

step1 = Step.create!(
  itinerary: itinary6,
  title: 'Puerto Iguazú',
  description: 'A small atypical restaurant at the edge of the waterfalls',
  category: 'food',
  city: 'Puerto Iguazú',
  rating: 3
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-2.png")), step: step1)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-1/buenos-aires-3.png.")), step: step1)

step2 = Step.create!(
  itinerary: itinary6,
  title: 'Parque Nacional Iguazú',
  description: 'Incredible, to do absolutely!',
  category: 'nature',
  city: 'Puerto Libertad',
  rating: 5
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)

step3 = Step.create!(
  itinerary: itinary6,
  title: 'Parque Iberá',
  description: 'Park full of swamps, impressive!',
  category: 'nature',
  city: 'Concepcion',
  rating: 4
)

Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota-2.png")), step: step2)
Photo.create(picture: File.open(Rails.root.join("db/fixtures/pictures/itinerary-1/step-2/bogota3.png")), step: step2)


















