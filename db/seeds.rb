# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cardio = Category.create!(name: 'Cardio')
gym = Category.create!(name: 'Gym')
fitness = Category.create!(name: 'Fitness')
movies = Category.create!(name: 'Movies')
videoGames = Category.create!(name: 'Video Games')
musicalInstruments = Category.create!(name: 'Musical Instruments')
studying = Category.create!(name: 'Studying')
exploration = Category.create!(name: 'Exploration')
onCampusEvents = Category.create!(name: 'On Campus Events')


ash = Account.create!(
							first_name: 'Ashley',
							last_name:  'Packard',
							email:      'packarda1@wit.edu',
							password:              'password',
							password_confirmation: 'password')

tom = Account.create!(
							first_name: 'Tom',
							last_name:  'Lisi',
							email:      'lisit@wit.edu',
							password:              'password',
							password_confirmation: 'password')

mike = Account.create!(
							first_name: 'Mike',
							last_name:  'Kucharski',
							email:      'kucharskim@wit.edu',
							password:              'password',
							password_confirmation: 'password')

becca = Account.create(
							first_name: 'Becca',
							last_name:  'Tennent',
							email:      'tennentb@wit.edu',
							password:              'password',
							password_confirmation: 'password')

brian = Account.create(
							first_name: 'Brian',
	            last_name:  'Conway',
	            email:      'conwayb@wit.edu',
	            password:              'password',
	            password_confirmation: 'password')

danny = Account.create!(
							first_name: 'Danny',
							last_name:  'Nguyen',
							email:      'nguyend@wit.edu',
							password:              'password',
							password_confirmation: 'password') 

artem = Account.create!(
							first_name: 'Artem',
							last_name:  'Vasenin',
							email:      'vasenina@wit.edu',
							password:              'password',
							password_confirmation: 'password')

brian.posts.create!(
							title: 'WIT Career Fair',
							body: 'Need someone to look over my resume and help me pick out an outfit. '+
										'Lets go to the career fair!',
							meeting_date: '2015-03-20',
							meeting_time: '13:00:00',
							location: 'Tansey Gym',
							category: onCampusEvents)

becca.posts.create!(
							title: 'W@W Event - Meal or No Meal',
							body: 'Who wants to be on my team? Just kidding its not a team activity but I '+
										'need someone to go with! You could win food and prizes. Yum!',
							meeting_date: '2015-07-01',
							meeting_time: '13:00:00',
							location: 'EWT Auditorium',
							category: onCampusEvents)

mike.posts.create!(
						title: 'Travelling to Rockport',
						body: 'Im travelling to Rockport for the day using the commuter rail. Who wants '+
									'to join me?! Itll be so much fun, the ocean!! This post is going to be '+
									'really long. Im travelling to Rockport for the day using the commuter rail. '+
									'Who wants to join me?! Itll be so much fun, the ocean!! This post is going '+
									'to be really long.Im travelling to Rockport for the day using the commuter '+
									'rail. Who wants to join me?! Itll be so much fun, the ocean!! This post is '+
									'going to be really long.',
						meeting_date: '2015-07-30',
						meeting_time: '12:00:00',
						location: 'North Station',
						category: exploration)

mike.posts.create!(
						title: 'Numerical Analysis Final Exam Tutoring',
						body: 'I love teaching! Come to me for help--Ill be in the library all day. Study '+
									'session jaaaaaaaamsssssss guuuuyyysssss looooooooooook at this looooooo'+
									'ooooooooooooong poooooooooooooost.',
						meeting_date: '2015-04-16',
						meeting_time: '09:00:00',
						location: 'Beatty Library',
						category: studying)

danny.posts.create!(
						title: 'Drum Lessons',
						body: 'Been teaching band for 5 years. Im looking to take on students. Professoinal '+
									'level myself will teach anyone whos looking to learn the drums.',
						meeting_date: '2015-05-15',
						meeting_time: '14:30:00',
						location: 'EWT Auditorium',
						category: musicalInstruments)

mike.posts.create!(
						title: 'WOW Tournament Tonight',
						body: 'Im hosting a world of warcraft tournament tonight at my dorm! Stop on by, free food and drinks.',
						meeting_date: '2015-03-21',
						meeting_time: '20:00:00',
						location: '555 - Room 305',
						category: videoGames)

artem.posts.create!(
						title: 'Yoga and Pilates Partner Desired', 
						body: 'I need a yoga partner three times a week and a pilates partner the other three '+
									'days. Hour long workouts, advanced moves.',
						meeting_date: '2015-06-01',
						meeting_time: '11:00:00',
						location: 'The Fens Track',
						category: fitness)

tom.posts.create!(
						title: 'Weight Spotter',
						body: 'Hey everyone, Im looking for a weight spotter this weekend. I bench 250lbs and '+
									'do various other routines at the schuman fitness center. Lets work out together! '+
									'I need a spotter come on lets gooooooooo',
						meeting_date: '2015-04-04',
						meeting_time: '09:00:00',
						location: 'Schuman Fitness Center',
						category: gym)

brian.posts.create!(
						title: 'The Avengers', 
						body: 'Who wants to go see the new Avengers movie with me?!',
						meeting_date: '2015-03-30',
						meeting_time: '18:00:00',
						location: 'AMC - Boston Commons',
						category: movies)

ash.posts.create!(
						title: 'Running Partner Wanted',
						body: 'Hey everyone I am looking for a running partner on weekdays!',
						meeting_date: '2015-03-23',
						meeting_time: '10:30:00',
						location: 'The Fens',
						category: cardio)

50.times do
	category_id = (rand(9) + 1)
	category = Category.find(category_id).name
	created_at = Time.at(2.months.ago + rand * (Time.now.to_f - 2.months.ago.to_f))

	account = Account.find( rand(7) + 1 )
	account.posts.create!(
						title: "This is a #{category} Title",
	       	  body:  "This is a post about #{category}. Who wants to hangount? Itll be loooots of fun :D ",
						meeting_date: created_at.strftime('%Y-%m-%d'),
						meeting_time: '20:30:00',
						location: 'A Meadow',
						category: Category.find(category_id),
						created_at: created_at,
						updated_at: created_at)
end

# used to manually test users with no posts, interests, comments, etc
Account.create!(
						first_name: 'Blank',
						last_name:  'Blankerson',
						email:      'blank@wit.edu',
						password:              'password',
						password_confirmation: 'password')


