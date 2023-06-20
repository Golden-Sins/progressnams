#---
# Excerpted from "Agile Web Development with Rails 7",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/rails7 for more book information.
#---
# encoding: utf-8
Product.delete_all
Product.create!(title: 'W. šekspīrs Hamlets',
  description:
    %{<p>
    “Hamlets” pieder pie pasaules literatūras klasikas pērlēm un tiek uzskatīts par vienu no izcilākajām slavenā angļu renesanses laika dramaturga Viljama Šekspīra (1564–1616) traģēdijām. Tajā V. Šekspīrs, rādot saspringtus notikumus Dānijas karaļa galmā un tēlojot prinča Hamleta personiskās dzīves traģēdiju, ir risinājis filozofiskus jautājumus par cilvēka sūtību un dzīves jēgu. Luga daudzkārt bijusi iestudēta Latvijas teātros.
      </p>},
  image_url: 'shakespear.jpeg',
  price: 19.95)
# . . .

  User.create :name => "User1", :password => "user123"
