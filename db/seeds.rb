books = Book.create([
  {title: 'Pani Einstein', author: 'Marie Benedict'},
  {title: 'Czy jesteś psychopatą?', author: 'Jon Ronson'},
  {title: 'Czrownice z Salem Falls', author: 'Jodi Picoult'},
  {title: 'Ekożona', author: 'Michal Viewegh'},
  {title: 'Historia ucieczki', author: 'Elena Ferrante'},
  {title: 'Inna niż wszystkie', author: 'Joshilyn Jackson'},
  {title: 'Najmroczniejszy sekret', author: 'Alex Marwood'},
  {title: 'Domofon', author: 'Zygmunt Miłoszewski'},
  {title: 'Opowieść Podręcznej', author: 'Margaret Atwood'},
  {title: 'Miniaturzystka', author: 'Jessie Burton'},
])

puts "#{books.count} books created"