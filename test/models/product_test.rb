require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
    assert product.errors[:description].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title: "Test title",
      description: "Test discription",
      image_url: "TestImage.jpg"
    )

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    product.valid?
  end

  def new_product(image_url)
    Product.new(
      title: "Test title",
      description: "Test discription",
      price: 1,
      image_url: image_url
    )
  end

  test "product image url must be valid" do
    good = %w{ test.gif test.jpg test.png TEST.GIF TEST.JPG TEST.PNG http://gibberish/test.gif }
    bad = %w{ test.doc test.jpgs test.gif.more }

    good.each do |image_url|
      assert new_product(image_url).valid?,
      "#{image_url} must be valid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?,
      "#{image_url} must be invalid"
    end
  end

  test "produst must have a unique title" do
    product = Product.new(
      title: products(:ruby).title,
      description: "Test description",
      price: 1,
      image_url: "ruby.jpg"
    )
    
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  test "product title must have length of at least 10 characters" do
    product = Product.new(
      title: "sho",
      description: "Test discription",
      image_url: "TestImage.jpg",
      price: 1
    )

    assert product.invalid?
    assert_equal ["minimum 10 characters pls"], product.errors[:title]


    product.title = "Test title"
    product.valid?
  end
end
