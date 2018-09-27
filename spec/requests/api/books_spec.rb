require 'rails_helper'

RSpec.describe 'Requests to BooksController', type: :request do
  let(:book_1) { create(:book_with_authors) }
  let(:author_1) { create(:author) }

  describe 'get list of books' do
    before do
      get '/api/v1/books', headers: json_headers
    end

    it 'process request to index' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'get book details' do
    before do
      get "/api/v1/books/#{book_1.id}", headers: json_headers
    end

    it 'process request to show' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'create new book' do
    let(:request_body) { {
        book: {
            title: "hello rails",
            release_date: "2018-08-25",
            base_price: "10.00",
            currency: "$",
            author_ids: [author_1.id]
        }
    } }

    before do
      post '/api/v1/books',
           params: request_body.to_json,
           headers: json_headers
    end

    it 'process request to create' do
      expect(response).to have_http_status(:no_content)
    end
  end
end