require 'test_helper'

class SkillManagementsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get skill_managements_show_url
    assert_response :success
  end

  test 'should get edit' do
    get skill_managements_edit_url
    assert_response :success
  end
end
