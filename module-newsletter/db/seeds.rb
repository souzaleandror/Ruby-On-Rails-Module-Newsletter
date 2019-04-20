
puts 'START DESTROY ALL'
Admin.destroy_all
Newsletter.destroy_all
puts 'END DESTROY ALL'

Admin.create(email: 'demo@demo.com', password: 'demo123')
Admin.create(email: 'hello@hello.com', password: 'hello123')
Admin.create(email: 'admin@admin.com', password: 'admin123')

puts 'START Newsletter'
Newsletter.create(name: 'Emilio', email: 'emilio@gmail.com', accepted: true, inactive: false)
Newsletter.create(name: 'jonh', email: 'jonh@gmail.com', accepted: true, inactive: false)
Newsletter.create(name: 'maria', email: 'maria@gmail.com', accepted: true, inactive: false)
puts 'END Newsletter'