# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by(name: 'Brianna', picture: 'https://boundingintocomics.com/wp-content/uploads/2015/09/Elysia1-5.jpg', hometown: 'Rochester, NY', current_city: 'Brooklyn, NY', age: 26, bio: 'Lets save the world!')
User.find_or_create_by(name: 'Dana', picture: 'https://comps.canstockphoto.com/a-female-superhero-vector-clipart_csp17773202.jpg', hometown: 'Oceanside, NY', current_city: 'Manhattan, NY', age: 23, bio: 'Clean up after yourselves!')

Project.find_or_create_by(name: 'Beach Clean Up', location: 'Coney Island', date: '2019-05-10', story: 'Come help us clean up the beach. Just in time for summer!', start_image: 'https://environmentalpolltoday.files.wordpress.com/2015/02/img_0501.jpg', end_image: '', completed: false, time: '11:30:00')
Project.find_or_create_by(name: 'Highway Clean Up', location: 'BQE', date: '2019-05-11', story: 'Stop throwing trash!', start_image: 'http://archive.commercialappeal.com/Services/image.ashx?domain=www.commercialappeal.com&file=gc_litter1_16975226_ver1.0_640_480.jpg&resize=', end_image: '', completed: false, time: '10:30')
Project.find_or_create_by(name: 'Park Clean Up', location: 'Prospect Park', date: '2019-04-10', story: 'Lets beautify this park!', start_image: 'https://cbsnewyork.files.wordpress.com/2011/06/prospect-park.jpg?w=420', end_image: 'https://c8.alamy.com/comp/CYJRJ5/volunteers-help-to-clean-up-prospect-park-in-brooklyn-ny-after-hurricane-CYJRJ5.jpg', completed: true, time: '10:30')

Volunteer.find_or_create_by(user_id: 1, project_id: 1, admin: true)
Volunteer.find_or_create_by(user_id: 2, project_id: 2, admin: true)
Volunteer.find_or_create_by(user_id: 1, project_id: 2, admin: false)
Volunteer.find_or_create_by(user_id: 2, project_id: 1, admin: false)
