require "test_helper"

class PoketypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poketype = poketypes(:one)
  end

  test "should get index" do
    get poketypes_url
    assert_response :success
  end

  test "should get new" do
    get new_poketype_url
    assert_response :success
  end

  test "should create poketype" do
    assert_difference("Poketype.count") do
      post poketypes_url, params: { poketype: { name: @poketype.name, poke_id: @poketype.poke_id, url: @poketype.url } }
    end

    assert_redirected_to poketype_url(Poketype.last)
  end

  test "should show poketype" do
    get poketype_url(@poketype)
    assert_response :success
  end

  test "should get edit" do
    get edit_poketype_url(@poketype)
    assert_response :success
  end

  test "should update poketype" do
    patch poketype_url(@poketype), params: { poketype: { name: @poketype.name, poke_id: @poketype.poke_id, url: @poketype.url } }
    assert_redirected_to poketype_url(@poketype)
  end

  test "should destroy poketype" do
    assert_difference("Poketype.count", -1) do
      delete poketype_url(@poketype)
    end

    assert_redirected_to poketypes_url
  end
end
