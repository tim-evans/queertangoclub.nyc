# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lgbt_center = Location.create({
  name: 'The Lesbian, Gay, Bisexual, & Transgender Community Center',
  address_line: '207 W 13th St',
  extended_address: 'Room 213',
  city: 'New York',
  region_code: 'NY',
  postal_code: '10011',
  photo: File.open('/Users/tim/Desktop/the_center.png')
})

Location.create({
  name: 'The Bureau of General Services: Queer Division',
  address_line: '207 W 13th St',
  extended_address: 'Room 210',
  city: 'New York',
  region_code: 'NY',
  postal_code: '10011',
  event_location: lgbt_center,
  safe_space: true
})

Location.create({
  name: 'Think Coffee',
  address_line: '207 W 13th St',
  city: 'New York',
  region_code: 'NY',
  postal_code: '10011',
  event_location: lgbt_center,
  safe_space: true
})

sheen_center = Location.create({
  name: 'The Sheen Center',
  address_line: '18 Bleecker Street',
  extended_address: 'Studios A & B',
  city: 'New York',
  region_code: 'NY',
  postal_code: '10012',
  photo: File.open('/Users/tim/Desktop/sheen_center.png')
})

Location.create({
  name: 'Housing Works',
  address_line: '126 Crosby Street',
  city: 'New York',
  region_code: 'NY',
  postal_code: '10012',
  event_location: sheen_center,
  safe_space: true,
  photo: File.open('/Users/tim/Desktop/housing_works.png')
})

Location.create({
  name: 'Lafayette',
  address_line: '380 Lafayette Street',
  city: 'New York',
  region_code: 'NY',
  postal_code: '10003',
  event_location: sheen_center,
  photo: File.open('/Users/tim/Desktop/lafayette.png')
})

Location.create({
  name: 'La Columbe Torrefaction',
  address_line: '400 Lafayette Street',
  city: 'New York',
  region_code: 'NY',
  postal_code: '10012',
  event_location: sheen_center,
  photo: File.open('/Users/tim/Desktop/la_colombe.png')
})


inauguration = Milonga.create({
  title: 'Inaugural Milonga',
  starts_at: DateTime.parse("2015-10-17"),
  ends_at: DateTime.parse("2015-10-17"),
  cover_photo: File.open('/Users/tim/Desktop/inaugural_cover.png')
})

rebecca_shulman = Teacher.create({
  name: 'Rebecca Shulman',
  url: 'http://rebeccatango.com/'
})

Photo.create({
  teacher: rebecca_shulman,
  attachment: File.open('/Users/tim/Desktop/rebecca_shulman.png')
})

lexa_rosean = Teacher.create({
  name: 'Lexa Roséan',
  url: 'http://www.lexarosean.com/tango.html'
})

Photo.create({
  teacher: lexa_rosean,
  attachment: File.open('/Users/tim/Desktop/lexa_rosean.png')
})

walter_perez = Teacher.create({
  name: 'Walter Perez'
})

Photo.create({
  teacher: walter_perez,
  attachment: File.open('/Users/tim/Desktop/walter_perez.jpg')
})

maria_jose = Teacher.create({
  name: 'María José Sosa'
})

Photo.create({
  teacher: maria_jose,
  attachment: File.open('/Users/tim/Desktop/maria_jose.jpg')
})

meg_farrell = Teacher.create({
  name: 'Meg Farrell',
})

Photo.create({
  teacher: meg_farrell,
  attachment: File.open('/Users/tim/Desktop/meg_farrell.jpg')
})

edit_fasi = Teacher.create({
  name: 'Edit Fasi',
})

Photo.create({
  teacher: edit_fasi,
  attachment: File.open('/Users/tim/Desktop/edit_fasi.jpg')
})

Session.create({
  title: "Beginner's Class",
  starts_at: DateTime.parse("2015-10-17 18:30"),
  ends_at: DateTime.parse("2015-10-17 19:30"),
  guest: Guest.create({
    teacher: rebecca_shulman,
    role: 'Teacher'
  }),
  event: inauguration,
  location: lgbt_center
})

Session.create({
  title: "Milonga",
  starts_at: DateTime.parse("2015-10-17 19:30"),
  ends_at: DateTime.parse("2015-10-17 21:45"),
  guest: Guest.create({
    teacher: lexa_rosean,
    role: 'DJ'
  }),
  event: inauguration,
  location: lgbt_center
})

alter_ego = Milonga.create({
  title: 'Alter Ego',
  starts_at: DateTime.parse("2015-11-21"),
  ends_at: DateTime.parse("2015-11-21"),
  cover_photo: File.open('/Users/tim/Desktop/alter_ego_cover.png')
})

Session.create({
  title: "Class",
  starts_at: DateTime.parse("2015-11-21 18:30"),
  ends_at: DateTime.parse("2015-11-21 19:30"),
  guest: Guest.create({
    teacher: walter_perez,
    role: 'Teacher'
  }),
  event: alter_ego,
  location: lgbt_center
})

Session.create({
  title: "Milonga",
  starts_at: DateTime.parse("2015-11-21 19:30"),
  ends_at: DateTime.parse("2015-11-21 21:45"),
  guest: Guest.create({
    teacher: walter_perez,
    role: 'DJ'
  }),
  event: alter_ego,
  location: lgbt_center
})

holiday_milonga = Milonga.create({
  title: 'Holiday Milonga',
  starts_at: DateTime.parse("2015-12-19"),
  ends_at: DateTime.parse("2015-12-19"),
  cover_photo: File.open('/Users/tim/Desktop/holiday_cover.png')
})

Session.create({
  title: "Class",
  starts_at: DateTime.parse("2015-12-19 18:15"),
  ends_at: DateTime.parse("2015-12-19 19:15"),
  guest: Guest.create({
    teacher: maria_jose,
    role: 'Teacher'
  }),
  event: holiday_milonga,
  location: lgbt_center
})

Session.create({
  title: "Milonga",
  starts_at: DateTime.parse("2015-12-19 19:30"),
  ends_at: DateTime.parse("2015-12-19 21:45"),
  guest: Guest.create({
    teacher: meg_farrell,
    role: 'DJ'
  }),
  event: holiday_milonga,
  location: lgbt_center
})

milonga_janus = Milonga.create({
  title: 'Milonga Janus',
  starts_at: DateTime.parse("2015-01-16"),
  ends_at: DateTime.parse("2015-01-16"),
  cover_photo: File.open('/Users/tim/Desktop/janus_cover.png')
})

Session.create({
  title: "Class",
  starts_at: DateTime.parse("2015-12-19 18:15"),
  ends_at: DateTime.parse("2015-12-19 19:15"),
  guest: Guest.create({
    teacher: lexa_rosean,
    role: 'Teacher'
  }),
  event: milonga_janus,
  location: lgbt_center
})

Session.create({
  title: "Milonga",
  starts_at: DateTime.parse("2015-12-19 19:30"),
  ends_at: DateTime.parse("2015-12-19 21:45"),
  guest: Guest.create({
    teacher: edit_fasi,
    role: 'DJ'
  }),
  event: milonga_janus,
  location: lgbt_center
})

marc_vanzwoll = Teacher.create({
  name: 'Marc Vanzwoll',
  bio: 'Marc Vanzwoll has developed his approach to tango, which blends close connection and body awareness with individuality and balance by each partner, in San Francisco and Boston.

Since moving to the East Coast, he has been teaching in Boston and Cape Cod. This year he was honored to teach Intercambio at the NY Queer Tango Weekend and taught with Brigitta Winkler in performance seminars exploring expression, meaning, and emotion in tango at the International QueerTango Festival Berlin. While in Boston, Marc created and co-hosted “Letras de Tango”, focusing on the poetry and meaning of tango lyrics. He also co-authored and co-taught the workshops “Axis Awareness”, “Lady Leaders Workshop”, and “Men’s Following Technique”. Marc is passionate about Argentine Tango, and encourages everyone to participate.'
})

Photo.create({
  teacher: marc_vanzwoll,
  attachment: File.open('/Users/tim/Desktop/marc_1.jpg')
})

Photo.create({
  teacher: marc_vanzwoll,
  attachment: File.open('/Users/tim/Desktop/marc_2.jpg')
})

Photo.create({
  teacher: marc_vanzwoll,
  attachment: File.open('/Users/tim/Desktop/marc_3.jpg')
})

Photo.create({
  teacher: marc_vanzwoll,
  attachment: File.open('/Users/tim/Desktop/marc_4.jpg')
})

workshop = Workshop.create({
  title: 'Workshops with Marc Vanzwoll',
  starts_at: DateTime.parse("2016-01-30"),
  ends_at: DateTime.parse("2016-01-31"),
  cover_photo: File.open('/Users/tim/Desktop/marc_cover.png')
})

guest = Guest.create({
  teacher: marc_vanzwoll,
  role: 'Teacher'
})

Session.create({
  title: 'From Walking to Dancing',
  description: 'Take the ho-hum out of your walk, and dance. 4 ways to perfect your cross system walking while developing your Jedi tango powers.',
  starts_at: DateTime.parse("2016-01-30 13:00"),
  ends_at: DateTime.parse("2016-01-30 14:30"),
  ticket_cost: 3500,
  ticket_currency: 'usd',
  max_attendees: 30,
  guest: guest,
  event: workshop,
  location: sheen_center
})

Session.create({
  title: 'Not Your Average Intercambio',
  description: 'Switch roles with invisible transitions. Diversify, and make the Leader/Follower relationship dynamic. Your tango will never be the same.',
  starts_at: DateTime.parse("2016-01-30 15:00"),
  ends_at: DateTime.parse("2016-01-30 16:30"),
  ticket_cost: 3500,
  ticket_currency: 'usd',
  max_attendees: 30,
  guest: guest,
  event: workshop,
  location: sheen_center
})

Session.create({
  title: 'Practica',
  description: "Practice what you've learned after workshops or join us for some dancing.",
  starts_at: DateTime.parse("2016-01-30 16:30"),
  ends_at: DateTime.parse("2016-01-30 18:00"),
  event: workshop,
  location: sheen_center
})

Session.create({
  title: 'Cadena for You and for Me!',
  description: 'A classic pattern to brighten up your tango. 4 basic steps linked together with identical foot work pattern for both Leader and Follower. Find out why this pattern travels or stays in place, and is perfect for switching roles seamlessly',
  starts_at: DateTime.parse("2016-01-31 13:00"),
  ends_at: DateTime.parse("2016-01-31 14:30"),
  ticket_cost: 3500,
  ticket_currency: 'usd',
  max_attendees: 30,
  guest: guest,
  event: workshop,
  location: sheen_center
})

Session.create({
  title: 'Ocho Cortado Reloaded',
  description: 'Make it fun for yourself and your partner. Learn how to ocho cortado, then hack it. Small spaces? No problem. Hey Leaders and Followers, get creative!',
  starts_at: DateTime.parse("2016-01-31 15:00"),
  ends_at: DateTime.parse("2016-01-31 16:30"),
  ticket_cost: 3500,
  ticket_currency: 'usd',
  max_attendees: 30,
  guest: guest,
  event: workshop,
  location: sheen_center
})

Session.create({
  title: 'Practica',
  description: "Practice what you've learned after workshops or join us for some dancing.",
  starts_at: DateTime.parse("2016-01-31 16:30"),
  ends_at: DateTime.parse("2016-01-31 18:00"),
  event: workshop,
  location: sheen_center
})
