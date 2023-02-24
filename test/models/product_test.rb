require "test_helper"
class ProductTest < ActiveSupport::TestCase # test "the truth" do
  setup do
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"
    end
  fixtures :products
  test "product attributes must not be empty" do product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any? assert product.errors[:price].any? assert product.errors[:image_url].any?
  end
    test "product price must be positive" do
      product = Product.new(title: "My Book Title",
      description: "yyy", image_url: "zzz.jpg")
      product.price = -1
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]
      product.price = 0
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]
      product.price = 1
      assert product.valid?
    end
    def new_product(image_url) Product.new(title: "My Book Title",
      description: "yyy", price: 1, image_url: image_url)
      end
      test "image url" do
      ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
      http://a.b.c/x/y/z/fred.gif }
      bad = %w{ fred.doc fred.gif/more fred.gif.more }
      ok.each do |image_url|
      assert new_product(image_url).valid?,
      "#{image_url} must be valid" 
      end
      bad.each do |image_url|
        assert new_product(image_url).invalid?, "#{image_url} must be invalid"
    end 
  end
  test "product is not valid without a unique title - i18n" do 
    product = Product.new(title: products(:ruby).title,
    description: "yyy", price: 1, image_url: "fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
    product.errors[:title]
  end
    def create
      @product = Product.new(product_params)
      respond_to do |format| if @product.save
      format.html { redirect_to @product,
      notice: "Product was successfully created." }
      format.json { render :show, status: :created, location: @product }
      else
      puts @product.errors.full_messages format.html { render :new,status: :unprocessable_entity } 
      format.json { render json: @product.errors,status: :unprocessable_entity } 
      end
    end 
  end
    test "should create product" do assert_difference("Product.count") do
      post products_url, params: { product: {
      description: @product.description, image_url: @product.image_url, price: @product.price,
      title: @title,
      } }
end
test "should update product" do
  patch product_url(@product), params: { product: {
  description: @product.description, image_url: @product.image_url, price: @product.price,
  title: @title,
  } }
  assert_redirected_to product_url(@product)
end  
end
end