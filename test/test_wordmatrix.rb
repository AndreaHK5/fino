require_relative '../lib/wordmatrix.rb'
require 'minitest/autorun'


describe WordMatrix do
	before :each do
		@args = {}
		@args[:dictionary] = {art: "", hut: "", nut: ""}
		@line1 = ['r','t','t'] 
		@line2 = ['a','y','u']
		@line3 = ['i','n','h']
		@args[:table] = Matrix[@line1,@line2,@line3]
		@wordtable = WordMatrix.new @args

	end
	
	it "responds to is word" do
		true

	end

	it 'responds to is prefix' do
		true

	end

end