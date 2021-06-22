require "application_system_test_case"

class PriceRegistersTest < ApplicationSystemTestCase
  setup do
    @price_register = price_registers(:one)
  end

  test "visiting the index" do
    visit price_registers_url
    assert_selector "h1", text: "Price Registers"
  end

  test "creating a Price register" do
    visit price_registers_url
    click_on "New Price Register"

    fill_in "Begin at", with: @price_register.begin_at
    fill_in "Ends at", with: @price_register.ends_at
    fill_in "Price", with: @price_register.price
    fill_in "Product", with: @price_register.product_id
    click_on "Create Price register"

    assert_text "Price register was successfully created"
    click_on "Back"
  end

  test "updating a Price register" do
    visit price_registers_url
    click_on "Edit", match: :first

    fill_in "Begin at", with: @price_register.begin_at
    fill_in "Ends at", with: @price_register.ends_at
    fill_in "Price", with: @price_register.price
    fill_in "Product", with: @price_register.product_id
    click_on "Update Price register"

    assert_text "Price register was successfully updated"
    click_on "Back"
  end

  test "destroying a Price register" do
    visit price_registers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Price register was successfully destroyed"
  end
end
