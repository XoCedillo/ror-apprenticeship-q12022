require "application_system_test_case"

class AbilitiesTest < ApplicationSystemTestCase
  setup do
    @ability = abilities(:one)
  end

  test "visiting the index" do
    visit abilities_url
    assert_selector "h1", text: "Abilities"
  end

  test "should create ability" do
    visit abilities_url
    click_on "New ability"

    fill_in "Name", with: @ability.name
    fill_in "Poke", with: @ability.poke_id
    fill_in "Url", with: @ability.url
    click_on "Create Ability"

    assert_text "Ability was successfully created"
    click_on "Back"
  end

  test "should update Ability" do
    visit ability_url(@ability)
    click_on "Edit this ability", match: :first

    fill_in "Name", with: @ability.name
    fill_in "Poke", with: @ability.poke_id
    fill_in "Url", with: @ability.url
    click_on "Update Ability"

    assert_text "Ability was successfully updated"
    click_on "Back"
  end

  test "should destroy Ability" do
    visit ability_url(@ability)
    click_on "Destroy this ability", match: :first

    assert_text "Ability was successfully destroyed"
  end
end
