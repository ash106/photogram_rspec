require 'rails_helper'

feature "Deleting posts" do
  scenario "can delete posts" do
    post = create(:post, caption: "whoops!")

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("Problem solved! Post deleted.")
    expect(page).to_not have_content("whoops!")
  end
end