service = GoodreadsService.new

books = [
  service.find_book_by('28389305'),
  service.find_book_by('23354304'),
  service.find_book_by('28374893'),
  service.find_book_by('29339340'),
  service.find_book_by('30629270'),
  service.find_book_by('34662405'),
  service.find_book_by('36222873'),
  service.find_book_by('7667542'),
  service.find_book_by('23509546')
]

books.each(&:save)

puts "#{books.count} books created"

users = User.create [
  {
    name: 'Zosia',
    avatar_img: 'zosia.jpg',
    email: 'zosia@example.com',
    password: 'P@ssw0rd',
    password_confirmation: 'P@ssw0rd'
  },
  {
    name: 'Marysia',
    avatar_img: 'marysia.jpg',
    email: 'marysia@example.com',
    password: 'P@ssw0rd',
    password_confirmation: 'P@ssw0rd'
  },
  {
    name: 'Jasiu',
    avatar_img: 'jasiu.jpg',
    email: 'jasiu@example.com',
    password: 'P@ssw0rd',
    password_confirmation: 'P@ssw0rd'
  },
  {
    name: 'Michał',
    avatar_img: 'michal.jpg',
    email: 'michal@example.com',
    password: 'P@ssw0rd',
    password_confirmation: 'P@ssw0rd'
  }
]

puts "#{users.count} users created"
