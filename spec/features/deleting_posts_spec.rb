require 'rails_helper'

feature "Deleting posts" do
  background do
    user = create(:user)
    sign_in_with user
    post = create(:post, caption: "whoops!", user_id: user.id)
  end

  scenario "can delete posts" do
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("Problem solved! Post deleted.")
    expect(page).to_not have_content("whoops!")
  end
end