# -*- coding: utf-8 -*-

p 'States populating...'
[ "dolnośląskie", "kujawsko-pomorskie", "lubuskie", "łódzkie", "lubelskie", "mazowieckie", "małopolskie", "opolskie", "podlaskie", "podkarpackie", "pomorskie","śląskie", "świętokrzyskie", "warmińsko-mazurskie", "wielkopolskie", "zachodniopomorskie" ].each do |name|
  State.find_or_create_by_name({:name => name})
end

p 'Companies populating...'
[ "Bombardier/Can-am","Cectek","CF Moto", "Honda", "Kawasaki","KTM","Kymco", "Linhai", "Lucky Star", "Polaris", "Suzuki", "Yamaha", "Side by Side","Inne"].each do |name|
  Company.find_or_create_by_name({:name => name})
end

p 'User populating...'
unless User.find_by_login('admin')
  admin = Admin.new({:name => 'admin', :login => 'admin', :password => 'admin.123', :password_confirmation => 'admin.123', :email => 'dmarciniec@gmail.com'})
  admin.active = true
  admin.save_without_validation
end

p 'Event Categories populating...'
[ "12 godzinny wyścig","Cross Country","Cross Country PL","Enduro","Enduro PL","Impreza integracyjna","Maraton off-road","Motocross","Motocross PL","Mundial quadów","Obóz","Pokazy","Przeprawowa","Rajd","Rekreacyjno-sportowa","Sportowo-towarzyska","Supermoto","Supermoto PL","Szkolenie","Targi i wystawy","Turystyczno-przeprawowa","Wczasy na quadach","Wczasy off-roadowe","Wyprawa","Wyścigi","Zlot"].each do |name|
  EventCategory.find_or_create_by_name({:name => name})
end

p 'AdType populating...'
[{ :label => 'Quad', :name => 'quad' },
 { :label => 'Część', :name => 'part' }
].each do |ad_type|
  AdType.find_or_create_by_name(ad_type)
end
