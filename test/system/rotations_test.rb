require "application_system_test_case"

class RotationsTest < ApplicationSystemTestCase
  setup do
    @rotation = rotations(:one)
  end

  test "visiting the index" do
    visit rotations_url
    assert_selector "h1", text: "Rotations"
  end

  test "creating a Rotation" do
    visit rotations_url
    click_on "New Rotation"

    fill_in "Begins at", with: @rotation.begins_at
    fill_in "Branch office", with: @rotation.branch_Office_id
    fill_in "Department", with: @rotation.department_id
    fill_in "Employee", with: @rotation.employee_id
    fill_in "Ends at", with: @rotation.ends_at
    check "Head" if @rotation.head
    fill_in "Stall", with: @rotation.stall_id
    click_on "Create Rotation"

    assert_text "Rotation was successfully created"
    click_on "Back"
  end

  test "updating a Rotation" do
    visit rotations_url
    click_on "Edit", match: :first

    fill_in "Begins at", with: @rotation.begins_at
    fill_in "Branch office", with: @rotation.branch_Office_id
    fill_in "Department", with: @rotation.department_id
    fill_in "Employee", with: @rotation.employee_id
    fill_in "Ends at", with: @rotation.ends_at
    check "Head" if @rotation.head
    fill_in "Stall", with: @rotation.stall_id
    click_on "Update Rotation"

    assert_text "Rotation was successfully updated"
    click_on "Back"
  end

  test "destroying a Rotation" do
    visit rotations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rotation was successfully destroyed"
  end
end
