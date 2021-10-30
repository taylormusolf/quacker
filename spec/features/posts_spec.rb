require 'rails_helper'

feature 'creating a Post', type: :feature do 
    before :each do 
        create(:user)
        visit new_post_url
    end

    scenario "takes a body" do 
        expect(page).to have_content "New post"
        expect(page).to have_content "Body"
    end

    scenario "takes us back to post show" do 
        log_in_user(User.last)
        make_post('Its raining')
        expect(page).to have_content "One Single Post"
        expect(page).to have_content "Its raining"
        expect(current_path).to eq(post_path(Post.last))

    end

end

feature 'Removing a post', type: :feature do 
    before :each do 
        create(:user)
        log_in_user(User.last)
        make_post('to be deleted')
        save_and_open_page
        click_button('Delete this post')
        save_and_open_page
    end

    scenario "removes a post" do 
        expect(page).to_not have_content('to be deleted')
        expect(page).to have_content("All Posts")
    end
end