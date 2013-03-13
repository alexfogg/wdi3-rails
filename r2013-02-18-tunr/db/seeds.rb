Genre.delete_all
Song.delete_all
Album.delete_all
Artist.delete_all
User.delete_all
Mixtape.delete_all

g1 = Genre.create(:name => 'Classical')
g2 = Genre.create(:name => 'Rock')
g3 = Genre.create(:name => 'Top 40')

s1 = Song.create(:name => 'Thriller', :filename => 'Thriller.mp3', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/5/51/Michaeljacksonthrilleralbum.jpg/220px-Michaeljacksonthrilleralbum.jpg')
s2 = Song.create(:name => 'Billie Jean', :filename => 'BillieJean.mp3', :image => 'http://3.bp.blogspot.com/_YC1MSv35cns/S76agHp6DtI/AAAAAAAAANM/Eb9VsuSdrmA/s1600/michael-jackson-billie-jean-234986.jpg')
s3 = Song.create(:name => 'Smells Like Teen Spirit', :filename => 'SmellsLikeTeenSpirit.mp3', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/3/3c/Smells_Like_Teen_Spirit.jpg/220px-Smells_Like_Teen_Spirit.jpg')

a1 = Album.create(:name => 'Thriller', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/5/51/Michaeljacksonthrilleralbum.jpg/220px-Michaeljacksonthrilleralbum.jpg')
a2 = Album.create(:name => 'Nevermind', :image => 'http://images.fanpop.com/images/image_uploads/Nirvana--Nevermind-the-90s-368076_1416_1398.jpg')
a3 = Album.create(:name => 'The White Album', :image => 'http://toxicways.com/wp-content/uploads/2012/03/The-Beatles-%E2%80%93-White-Album.jpg')

r1 = Artist.create(:name => 'Michael Jackson', :image => 'http://bossip.files.wordpress.com/2012/06/mj-rip-e1340636729324.jpg')
r2 = Artist.create(:name => 'Nirvana', :image => 'http://msnbcmedia.msn.com/j/MSNBC/Components/Slideshows/_production/ss-110915-nirvana-nevermind/ss-110916-nevermind-nirvana-tease.photoblog600.jpg')
r3 = Artist.create(:name => 'Beatles', :image => 'http://images6.fanpop.com/image/photos/32800000/The-Beatles-the-beatles-32839194-999-855.jpg')

u1 = User.create(:balance => 352.81, :name => 'Bob', :image => 'http://sigmaifa.co.uk/images/team-large/damon-george.jpg', :password => 'a', :password_confirmation => 'a')
u2 = User.create(:balance => 250.21, :name => 'Alice', :image => 'http://stlpwa.org/images/site/home-slideshow/professional-woman-4.jpg', :password => 'a', :password_confirmation => 'a')
u3 = User.create(:balance => 311.46, :name => 'Sue', :image => 'http://www.cdc.gov/ncbddd/pediatricgenetics/images/pediatric-genetics-woman.jpg', :password => 'a', :password_confirmation => 'a')
u4 = User.create(:balance => 989.98, :name => 'Admin', :image => 'http://openclipart.org/image/800px/svg_to_png/174534/administrator.png', :password => 'a', :password_confirmation => 'a')
u4.is_admin = true
u4.save

m1 = Mixtape.create(:name => 'Easy Listening')
m2 = Mixtape.create(:name => 'Workout Music')
m3 = Mixtape.create(:name => 'Old School')

r1.songs << s1 << s2
r2.songs = [s3]
a1.songs = [s1, s2]
a2.songs << s3
g3.songs = [s1, s2, s3]
u1.mixtapes = [m1, m2]
u3.mixtapes = [m3]
m3.songs = [s1, s2, s3]
u1.albums = [a1, a2]
