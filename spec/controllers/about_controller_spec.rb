RSpec.describe AboutController, type: :controller do
  render_views

  describe 'GET #index' do
    before do
      get :index
    end

    it 'renders index template' do
      expect(response).to render_template(:index)
    end

    it 'returns 200' do
      expect(response).to have_http_status(:ok)
    end
  end
end
