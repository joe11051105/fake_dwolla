require 'sinatra/base'

module FakeDwolla
  class StubApp < Sinatra::Base

    # Customers
    post '/customers' do
      json_headers 200, fixture('create_customer')
    end

    get '/customers/:customer_id' do
      json_response 200, fixture('retrieve_customer')
    end

    # Documents
    post '/customers/:customer_id/documents' do
      json_response 200, fixture('create_document')
    end

    # Instant account verification
    post '/customers/:customer_id/iav-token' do
      json_response 200, fixture('create_iav_token')
    end

    # Funding Sources
    get '/customers/:customer_id/funding-sources' do
      json_response 200, fixture('list_funding_source')
    end

    get '/funding-sources/:funding_sources_id/balance' do
      json_response 200, fixture('retrieve_balance')
    end

    post '/funding-sources/:funding_sources_id' do
      json_response 200, fixture('delete_funding_source')
    end

    # Transfers
    get '/transfers/:transfer_id' do
      if params[:transfer_id] == "bank_transaction"
        json_response 200, fixture('retrieve_bank_transfer')
      else
        json_response 200, fixture('retrieve_transfer')
      end
    end

    post '/transfers' do
      json_headers 200, fixture('create_transfer')
    end

    private

    def fixture(file_name)
      file_path = File.join(FakeDwolla.fixture_path, "#{file_name}.json")
      File.open(file_path, 'rb').read
    end

    def json_response(response_code, file)
      content_type :json
      status response_code
      file
    end

    def json_headers(response_code, file)
      [
        response_code,
        JSON.load(file),
        []
      ]
    end
  end
end
