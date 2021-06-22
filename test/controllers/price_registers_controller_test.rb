require "test_helper"

class PriceRegistersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_register = price_registers(:one)
  end

  test "should get index" do
    get price_registers_url
    assert_response :success
  end

  test "should get new" do
    get new_price_register_url
    assert_response :success
  end

  test "should create price_register" do
    assert_difference('PriceRegister.count') do
      post price_registers_url, params: { price_register: { begin_at: @price_register.begin_at, ends_at: @price_register.ends_at, price: @price_register.price, product_id: @price_register.product_id } }
    end

    assert_redirected_to price_register_url(PriceRegister.last)
  end

  test "should show price_register" do
    get price_register_url(@price_register)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_register_url(@price_register)
    assert_response :success
  end

  test "should update price_register" do
    patch price_register_url(@price_register), params: { price_register: { begin_at: @price_register.begin_at, ends_at: @price_register.ends_at, price: @price_register.price, product_id: @price_register.product_id } }
    assert_redirected_to price_register_url(@price_register)
  end

  test "should destroy price_register" do
    assert_difference('PriceRegister.count', -1) do
      delete price_register_url(@price_register)
    end

    assert_redirected_to price_registers_url
  end
end
