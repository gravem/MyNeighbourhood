# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'clearing users and reports databases'

Note.destroy_all
Follow.destroy_all
Ticket.destroy_all
Comment.destroy_all
Report.destroy_all
User.destroy_all

photo_1 = URI.open('https://sites.rutgers.edu/acal51/wp-content/uploads/sites/291/2017/12/3859882-6269102771-Bruce.jpg')
user1 = User.new(name: 'Bruce Wayne', email: 'bruce@wayne.com', password: '123456', address: "1600 Pennsylvania Avenue NW, Washington, DC 20500", neighbourhood: "White House District")
user1.photo.attach(io: photo_1, filename: 'bruce_avatar.jpg', content_type: 'image/jpg')
user1.save!

photo_2 = URI.open('https://flxt.tmsimg.com/assets/59797_v9_bb.jpg')
user2 = User.new(name: 'Stacey', email: 'user1@test.com', password: '123456', address: "10 Downing Street, London SW1A 2AA, UK", neighbourhood: "Westminster")
user2.photo.attach(io: photo_2, filename: 'stacey_avatar.jpg', content_type: 'image/jpg')
user2.save!

photo_3 = URI.open('https://static.wikia.nocookie.net/spiderman-films/images/8/85/Mary_Jane_Watson_%28Kirsten_Dunst%29.jpg/revision/latest?cb=20210601233728')
user3 = User.new(name: 'Mary', email: 'user2@test.com', password: '123456', address: "221B Baker Street, London NW1 6XE, UK", neighbourhood: "Marylebone")
user3.photo.attach(io: photo_3, filename: 'mary_avatar.jpg', content_type: 'image/jpg')
user3.save!

photo_4 = URI.open('https://pyxis.nymag.com/v1/imgs/74b/2a3/6c8160504678c445e7d5da6679f4c22748-25-SarahConnor.jpg')
user4 = User.new(name: 'Sarah Connor', email: 'user3@test.com', password: '123456', address: "101 Hollywood Boulevard, Los Angeles, CA 90028", neighbourhood: "Hollywood")
user4.photo.attach(io: photo_4, filename: 'sarah_avatar.jpg', content_type: 'image/jpg')
user4.save!

photo_5 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1681717733/bwtoyborjeacyis1h77c.jpg')
user5 = User.new(name: 'Sam Mayhew', email: 'sam@gmail.com', password: '123456', address: "350 Fifth Avenue, New York, NY 10118", neighbourhood: "Manhattan")
user5.photo.attach(io: photo_5, filename: 'sam_avatar.jpg', content_type: 'image/jpg')
user5.save!

photo_6 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1682027009/sncxepk6muonqejzpuyz.jpg')
user6 = User.new(name: 'Sajethan Saku', email: 'saj@gmail.com', password: '123456', address: "1 Infinite Loop, Cupertino, CA 95014", neighbourhood: "Silicon Valley")
user6.photo.attach(io: photo_6, filename: 'saj_avatar.jpg', content_type: 'image/jpg')
user6.save!

photo_7 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1681473627/vbioye43gvixu2cgolkd.jpg')
user7 = User.new(name: 'Onos Ovueraye', email: 'onos@gmail.com', password: '123456', address: "1600 Amphitheatre Parkway, Mountain View, CA 94043", neighbourhood: "Mountain View")
user7.photo.attach(io: photo_7, filename: 'onos_avatar.jpg', content_type: 'image/jpg')
user7.save!

photo_8 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1681458390/yxcic8ztciovogmeggii.jpg')
user8 = User.new(name: 'Aasmund Gravem', email: 'gravem@gmail.com', password: '123456', address: "1 The Droveway, Brighton and Hove, Hove BN3 6LF", neighbourhood: "Hove")
user8.photo.attach(io: photo_8, filename: 'aasmund_avatar.jpg', content_type: 'image/jpg')
user8.save!


puts '8 test users created.'

photo_report1 = URI.open('https://images.unsplash.com/photo-1560782205-4dd83ceb0270?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80')
report1 = Report.new(title: 'Hole in sidewalk', description: 'There is a missing slab in the sidewalk outside Le Wagon. It can trip up little old ladies!', location: '41 Kingsland Rd, London E2 8AG', category: 'Repair', votes: '10', status: 'Unclaimed', user_id: user2.id)
report1.photos.attach(io: photo_report1, filename: 'pothole.jpg', content_type: 'image/jpg')
report1.save!

photo_report2 = URI.open('https://citylimits.org/wp-content/uploads/2019/08/IMG_4026-e1565128808437-771x578.jpg')
report2 = Report.new(title: 'Garden in empty lot', description: 'This empty lot would be perfect for a community garden', location: '34 Cremer St, London E2 8HD', category: 'Improvement', votes: '15', status: 'Unclaimed', user_id: user2.id)
report2.photos.attach(io: photo_report2, filename: 'litter_central_park.jpg', content_type: 'image/jpg')
report2.save!

photo_report3 = URI.open('https://images.squarespace-cdn.com/content/v1/58ac1caa1b10e326aa206413/1495036866701-PO62WWTEGERO8NC6PSEW/OFF+THE+WALL+-+A+BLANK+CANVAS+%231.JPG?format=500w')
report3 = Report.new(title: 'Mural on Elm St', description: 'There is an ugly wall of Elm Street. It would be better replaced with a mural.', location: '126 Kingsland Rd, London E2 8DP', category: 'Improvement', votes: '12', status: 'Unclaimed', user_id: user1.id)
report3.photos.attach(io: photo_report3, filename: 'graffiti_elm_st.jpg', content_type: 'image/jpg')
report3.save!

photo_report4 = URI.open('https://www.pumpcourtchambers.com/wp-content/uploads/2020/04/200414-Empty-Highstreet.jpeg')
report4 = Report.new(title: 'Flowerbed at Town Hall', description: 'The area around the town hall could be beautified with a flowerbed.', location: '32 Cremer St, London E2 8HD', category: 'Improvement', votes: '18', status: 'Unclaimed', user_id: user3.id)
report4.photos.attach(io: photo_report4, filename: 'town_hall_area.jpg', content_type: 'image/jpg')
report4.save!

photo_report5 = URI.open('https://img.freepik.com/premium-photo/vandalism-broken-bench-park_657590-6261.jpg?w=2000')
report5 = Report.new(title: 'Broken Bench in Park', description: 'The bench near the lake in the park is broken and needs repair.', location: '9 Pearson St, London E2 8JD', category: 'Repair', votes: '8', status: 'Unclaimed', user_id: user3.id)
report5.photos.attach(io: photo_report5, filename: 'broken_bench_park.jpg', content_type: 'image/jpg')
report5.save!

photo_report6 = URI.open('https://i2-prod.bristolpost.co.uk/news/bristol-news/article725591.ece/ALTERNATES/s615b/crossingJPG.jpg')
report6 = Report.new(title: 'Faded Crosswalk Lines', description: 'The crosswalk lines at the junction of Pine and 1st are faded. Repainting is needed.', location: '10 Whiston Rd, London E2 8FX', category: 'Repair', votes: '12', status: 'Unclaimed', user_id: user1.id)
report6.photos.attach(io: photo_report6, filename: 'faded_crosswalk.jpg', content_type: 'image/jpg')
report6.save!

photo_report7 = URI.open('https://media.newyorker.com/photos/590954782179605b11ad3e88/master/w_2560%2Cc_limit/Slideshow5_25.JPG')
report7 = Report.new(title: 'Poor Lighting', description: 'Street has poor lighting which makes it unsafe at night. More streetlights could improve the situation.', location: '23 Appleby St, London E2 8EP', category: 'Repair', votes: '10', status: 'Unclaimed', user_id: user4.id)
report7.photos.attach(io: photo_report7, filename: 'poor_lighting_oak_st.jpg', content_type: 'image/jpg')
report7.save!

photo_report8 = URI.open('https://picsandstuff.files.wordpress.com/2012/09/giant-park-bench-broken-hill-2012.jpg')
report8 = Report.new(title: 'Community garden in Park', description: 'Empty bit in the park would be perfect for a little community garden.', location: '178 Stanway St, London N1 5LH', category: 'Improvement', votes: '44', status: 'Unclaimed', user_id: user3.id)
report8.photos.attach(io: photo_report8, filename: 'overgrown_bushes_park.jpg', content_type: 'image/jpg')
report8.save!

puts '8 reports with location created'
