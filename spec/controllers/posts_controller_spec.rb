require 'rails_helper'

RSpec.describe PostsController, type: :controller do 
    describe "GET #index" do 
        it "renders the post index" do 
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "GET #new" do 
        it "brings up the form to make a post" do 
            allow(subject).to receive(:logged_in?).and_return(true)

            get :new 
            expect(response).to render_template(:new)
        end
    end

    describe "DELETE #destroy" do 
        let!(:test_post) { create(:post) }

        before :each do 
            allow(subject).to receive(:current_user).and_return(test_post.author)

            delete :destroy, params: { id: test_post.id }
        end

        it 'destroys the post' do 
            expect(Post.exists?(test_post.id)).to be false
        end

        it 'redirects to posts_url' do 
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(posts_url)
        end
    end

    describe "POST #create" do 
        before :each do 
            create(:user)
            allow(subject).to receive(:current_user).and_return(User.last)
        end

        let(:valid_params) { {post: {body: "This is a good post."}} }
        let(:invalid_params) { {post: {nada: ''}} }

        context 'with valid params' do 
            it 'creates the post' do 
                post :create, params: valid_params
                expect(Post.last.body).to eq("This is a good post.")
            end

            it 'redirects to the post show page' do 
                post :create, params: valid_params 
                expect(response).to redirect_to(post_url(Post.last.id))
            end
        end

        context 'with invalid params' do 
            before :each do 
                post :create, params: invalid_params
            end

            it 'renders the new template' do 
                expect(response).to render_template(:new)
            end

            it 'adds errors to flash' do 
                expect(flash[:errors]).to be_present
            end
        end
    end
end