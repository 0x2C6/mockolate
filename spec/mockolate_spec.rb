RSpec.describe Mockolate do
  context "parameter generator" do
    it 'should generate hash with given attributes' do
      class AuthorRequestParams < Mockolate::Request
        payload do
          string    :firstname,    value: 'John'
          string    :lastname,     value: 'Doe'
          integer   :age,          value: 21
          array     :books do 
            hash do
              string    :name,      value: 'Tehlikeli Oyunlar'
              string    :author,    value: 'Oguz Atay'
              integer   :published, value: 1973
            end
            hash do
              string    :name,      value: '1984'
              string    :author,    value: 'George Orwell'
              integer   :published, value: 1949
            end
          end
        end
      end
      
      # binding.pry
      
      expect(AuthorRequestParams.generate!).to eq([{
        :firstname => 'John',
        :lastname  => 'Doe',
        :age       => 21,
        :books     => [
          {:author => 'Oguz Atay', :name => 'Tehlikeli Oyunlar', :published => 1973},
          {:author=>"George Orwell", :name => '1984', :published=>1949}
        ]
      }])
    end
  end  
end
