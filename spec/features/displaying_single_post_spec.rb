require 'rails_helper'

feature "Can view individual posts" do
  background do
    user = create(:user)
    sign_in_with user
    @post = create(:post, user_id: user.id)
  end

  scenario "can click and view a single post" do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(@post))
  end
end