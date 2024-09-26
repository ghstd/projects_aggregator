10.times do
  PetProject.create(
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph,
    images: [Base64.encode64(File.read(Rails.root.join('app/assets/images/image.png')))],
    languages: Faker::Lorem.words(number: 2).join(' ').split(' '),
    libraries: Faker::Lorem.words(number: 2).join(' ').split(' '),
    resources: Faker::Lorem.words(number: 2).join(' ').split(' '),
    github: 'https://github.com',
    hosting: 'https://github.com',
    age: rand(1..100),
    is_game: (rand(1..10) > 5) ? true : false
  )
end
