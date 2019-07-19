require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
    @product = FactoryBot.create(:product)
  end


context 'GET #index' do
  it 'renders index' do
    get :index
    expect(response).to be_ok
    expect(response).to render_template('index')
  end
end

context 'GET #show' do
  it 'renders product show page' do
    get :show, params: { id: @product.id }
    expect(response).to be_ok
    expect(assigns(:product)).to eq @product
  end
end

describe 'GET #new' do
  context 'when user is admin' do
    before do
    sign_in @admin
  end

  it 'renders product new page' do
    get :new
    expect(response).to be_ok
    expect(response).to render_template('new')
  end
end

context 'when user is logged in but not admin' do
  before do
    sign_in @user
  end

  it 'redirects to root_path' do
    get :index
    expect(response).to be_ok
    expect(response).to render_template('index')
  end
end

context 'when user is not logged in' do
  it 'can not create new product' do
    get :new
    expect(response).not_to be_ok
  end
end
end

describe 'GET #edit' do
  context 'when user is admin' do
    before do
      sign_in @admin
    end

  it 'redirects to edit page' do
    get :edit, params: {id: @product.id}
    expect(response).to be_ok
    expect(assigns(:product)).to eq @product
  end
end

context 'when user is logged in but not admin' do
  before do
    sign_in @user
  end

  it 'can not edit product' do
    get :edit, params: {id: @product.id}
    expect(response).not_to redirect_to products_path
  end
end

context 'when user is not logged in' do
  it 'can not edit product' do
    get :new
    expect(response).not_to be_ok
  end
end
end

describe 'POST #create' do
  context 'when user is admin' do
    before do
      sign_in @admin
  end

  it 'creates new product' do
    expect(response).to be_successful
  end
end

context 'POST #create when logged in but not admin' do
  before do
    sign_in @user
  end
  it 'can not create new product' do
    expect(Product.new).not_to be_valid
  end
end

context 'when user is not logged in' do
  it 'can not create new product' do
    get :new
    expect(response).not_to be_ok
  end
end
end

describe 'DELETE #destroy' do
context 'when user is admin' do
  before do
    sign_in @admin
  end

  it 'can delete the product' do
    delete :destroy, params: {id: @product.id}
    expect(response).to redirect_to products_path
  end
end

context 'when user is logged in but not admin' do
  before do
    sign_in @user
  end

  it 'cannot delete product' do
    delete :destroy, params: { id: @product.id }
    expect(response).not_to redirect_to products_path
  end
end

context 'when user is not logged in' do
  it 'cannot edit product' do
    delete :destroy, params: { id: @product.id }
    expect(response).not_to redirect_to products_path
  end
end
end

describe "PUT #update" do
  before do
    sign_in @user
  end

  it "destroys product" do
    delete :destroy, params: {id: @product.id}
    expect(response).not_to render_template('index')
end
end
end
