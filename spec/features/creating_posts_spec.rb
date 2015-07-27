require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/charlie_cheese.jpeg')
    fill_in 'Caption', with: 'charlie likes his #cheeses'
    click_button 'Create Post'
    expect(page).to have_content('#cheeses')
    expect(page).to have_css("img[src*='charlie_cheese.jpeg']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'charlie likes his #cheeses'
    click_button 'Create Post'
    expect(page).to have_content("Halt, you fiend! You need an image to post here!")
  end
end