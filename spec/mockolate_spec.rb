RSpec.describe Mockolate do
  context "parameter generator" do
    it 'should generate hash with given attributes' do
      class AuthorRequestParams < Mockolate::Parameters
        attributes :fullname, :email, id: :integer
        attribute  :books do
          string  :title
          string  :author
          integer :published
        end
      end
      
      expect(
        AuthorRequestParams.generate do
          fullname 'Farhad Eyvazli'
          books(size: 2) do 
            title '1986', 'Tehlikeli oyunlar'
            author 'George Orwel', 'Oguz Atay'
          end
        end
        ).to eq({
        fullname: 'Farhad Eyvazli',
        email:    'dummy@gmail.com',
        books: [
          {title: '1986', author: 'George Orwel', published: 1980},
          {title: 'Tehlikeli oyunlar', author: 'Oguz Atay', published: 1990}
        ]
      })
    end
  end  
end
