Artist.delete_all
Painting.delete_all

Artist.create(:name => 'Michelangelo', :nationality => 'Turtle', :dob => '1475/3/6', :period => 'Pizza', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/0/0d/TMNTMichelangelo2007.jpg/200px-TMNTMichelangelo2007.jpg')
Artist.create(:name => 'Donatello', :nationality => 'Turtle', :dob => '1386/1/1', :period => 'Pizza', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/0/04/TMNTDonatello2007.jpg/200px-TMNTDonatello2007.jpg')
Artist.create(:name => 'Raphael', :nationality => 'Turtle', :dob => '1483/4/6', :period => 'Pizza', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/7/78/TMNTRaphael2007.jpg/200px-TMNTRaphael2007.jpg')
Artist.create(:name => 'Leonardo', :nationality => 'Turtle', :dob => '1452/4/15', :period => 'Pizza', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/d/d5/TMNTLeo2007.jpg/200px-TMNTLeo2007.jpg')
Artist.create(:name => 'Vincent van Gogh', :nationality => 'Dutch', :dob => '1795/3/2', :period => 'Impressionism', :image => 'http://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Van_Gogh_Self-Portrait_with_Straw_Hat_1887-Metropolitan.jpg/220px-Van_Gogh_Self-Portrait_with_Straw_Hat_1887-Metropolitan.jpg')
Artist.create(:name => 'Pablo Picasso', :nationality => 'Spanish', :dob => '1981/10/25', :period => 'Cubism', :image => 'http://upload.wikimedia.org/wikipedia/commons/9/98/Pablo_picasso_1.jpg')
Artist.create(:name => 'Pierre-Auguste Renoir', :nationality => 'French', :dob => '1841/2/25',:period => 'Impressionism', :image => 'http://upload.wikimedia.org/wikipedia/commons/f/fd/PARenoir.jpg')


Painting.create(:title => 'Starry Night', :year => '1889', :medium => 'Oil', :style => 'Landscape', :image => 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/757px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg')
Painting.create(:title => 'The Old Guitarist', :year => '1903', :medium => 'Oil', :style => 'Blue Period', :image => 'http://upload.wikimedia.org/wikipedia/en/thumb/b/bc/Old_guitarist_chicago.jpg/200px-Old_guitarist_chicago.jpg')
Painting.create(:title => 'The Weeping Woman', :year => '1937', :medium => 'Oil', :style => 'Cubism', :image => 'http://www.inminds.com/picasso-weeping-woman-1937.jpg')
Painting.create(:title => 'Pink and Blue', :year => '1881', :medium => 'Oil', :style => 'Impressionism', :image => 'http://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Renoir_Mlles_Cahen_d_Anvers.jpg/250px-Renoir_Mlles_Cahen_d_Anvers.jpg')
Painting.create(:title => 'The Creation of Adam', :year => '1551', :medium => 'Plaster', :style => 'Renaissance', :image => 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Creaci%C3%B3n_de_Ad%C3%A1n.jpg/300px-Creaci%C3%B3n_de_Ad%C3%A1n.jpg')
Painting.create(:title => 'Mona Lisa', :year => '1519', :medium => 'Oil', :style => 'Portrait', :image => 'http://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/250px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg')
Painting.create(:title => 'Transfiguration', :year => '1520', :medium => 'Oil', :style => 'Renaissance', :image => 'http://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Transfiguration_Raphael.jpg/300px-Transfiguration_Raphael.jpg')