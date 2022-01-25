require "test_helper"

class AbilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ability = abilities(:one)
  end

  test "should get index" do
    get abilities_url
    assert_response :success
  end

  test "should get new" do
    get new_ability_url
    assert_response :success
  end

  test "should create ability" do
    assert_difference("Ability.count") do
      post abilities_url, params: { ability: { name: @ability.name, poke_id: @ability.poke_id, url: @ability.url } }
    end

    assert_redirected_to ability_url(Ability.last)
  end

  test "should show ability" do
    get ability_url(@ability)
    assert_response :success
  end

  test "should get edit" do
    get edit_ability_url(@ability)
    assert_response :success
  end

  test "should update ability" do
    patch ability_url(@ability), params: { ability: { name: @ability.name, poke_id: @ability.poke_id, url: @ability.url } }
    assert_redirected_to ability_url(@ability)
  end

  test "should destroy ability" do
    assert_difference("Ability.count", -1) do
      delete ability_url(@ability)
    end

    assert_redirected_to abilities_url
  end
end
