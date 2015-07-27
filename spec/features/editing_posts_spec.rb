require 'rails_helper'

feature "Editing posts" do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario "can edit a post" do
    fill_in 'Caption', with: "Oh god, you weren’t meant to see this picture!"
    click_button 'Update Post'
    expect(page).to have_content("Post updated hombre.")
    expect(page).to have_content("Oh god, you weren’t meant to see this picture!")
  end

  scenario "post needs a picture" do
    attach_file('Image', 'spec/files/testpod.kml')
    click_button 'Update Post'
    expect(page).to have_content("Something is wrong with your form!")
  end
end