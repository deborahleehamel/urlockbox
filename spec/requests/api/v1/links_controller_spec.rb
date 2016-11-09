require 'rails_helper'

describe "All Links" do
	context "#Index" do
		xit 'can return all links' do
			user = User.create(email: 'bernie@tnemail.com', password: 'password')
			added_link = user.links.create(title: 'Berney Sanders', url: 'http://berniesanders.com')

			get "/api/v1/links/"

			links = JSON.parse(response.body)
			link = links.first

			expect(response).to be_success
			expect(link['title']).to eq(added_link.title)
			expect(link['url']).to eq(added_link.url)
			expect(link['read']).to eq(added_link.read)
			expect(link['user_id']).to eq(added_link.user_id)

		end
  end

		context "#Update" do
		xit 'can update a single link' do
			user = User.create(email: 'bernie@tnemail.com', password: 'password')
			added_link = user.links.create(title: 'Berney Sanders', url: 'http://berniesanders.com')
			params = { title: "Democracy Now", url: "http://democracynow.org, read: true"}

			post "/api/v1/users/#{user.id}/links/#{added_link.id}", link: params

			links = JSON.parse(response.body)
			link = links.first

			expect(response).to be_success
			expect(link['title']).to eq('Democracy Now')
			expect(link['url']).to eq('http://democracynow.org')
			expect(link['read']).to eq(true)
			expect(link['user_id']).to eq(added_link.user_id)

		end
	end


end
