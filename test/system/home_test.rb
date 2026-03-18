require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_url
    assert_text "Amandine Atelier Digital"
  end
end
