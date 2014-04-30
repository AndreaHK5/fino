require_relative '../lib/wordmatrix.rb'
require 'minitest/autorun'


describe WordMatrix do
	before :each do
		@args = {}
		@args[:dictionary] = ["art", "hut", "nut"]
		@line1 = ['r','t','t'] 
		@line2 = ['a','y','u']
		@line3 = ['i','n','h']
		@args[:table] = Matrix[@line1,@line2,@line3]
		@wordtable = WordMatrix.new @args

	end
	
	it "responds to is word" do
		word1 = 'art'
		word2 = 'any'
		word3 = 'nut'
		@wordtable.is_valid_word?(word1).must_equal true
		@wordtable.is_valid_word?(word2).must_equal false

	end

	it 'responds to is prefix' do
		prefix1 = 'hu'
		prefix2 = 'hut'
		prefix3 = 'n'

		@wordtable.is_prefix?(prefix1).must_equal true
		@wordtable.is_prefix?(prefix2).must_equal false
		@wordtable.is_prefix?(prefix3).must_equal true


	end

end