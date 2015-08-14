require('capybara/rspec')
require('./app.rb')
require('launchy')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('dictionary test path', {:type => :feature}) do
  before () do
    Word.clear
    Definition.clear
  end

 it('serves the index page which will ask the user to input a word and definition') do
   visit('/')
   fill_in('word', :with => 'Tacocat')
   select('noun', :from => 'type')
   fill_in('definition_text', :with => 'A cat that likes tacos.')
   click_button('Add Word')
   expect(page).to have_content('A cat that likes tacos.')
 end

end
