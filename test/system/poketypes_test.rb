require "application_system_test_case"

class PoketypesTest < ApplicationSystemTestCase
  setup do
    @poketype = poketypes(:one)
  end

  test "visiting the index" do
    visit poketypes_url
    assert_selector "h1", text: "Poketypes"
  end

  test "should create poketype" do
    visit poketypes_url
    click_on "New poketype"

    fill_in "Name", with: @poketype.name
    fill_in "Poke", with: @poketype.poke_id
    fill_in "Url", with: @poketype.url
    click_on "Create Poketype"

    assert_text "Poketype was successfully created"
    click_on "Back"
  end

  test "should update Poketype" do
    visit poketype_url(@poketype)
    click_on "Edit this poketype", match: :first

    fill_in "Name", with: @poketype.name
    fill_in "Poke", with: @poketype.poke_id
    fill_in "Url", with: @poketype.url
    click_on "Update Poketype"

    assert_text "Poketype was successfully updated"
    click_on "Back"
  end

  test "should destroy Poketype" do
    visit poketype_url(@poketype)
    click_on "Destroy this poketype", match: :first

    assert_text "Poketype was successfully destroyed"
  end
end
