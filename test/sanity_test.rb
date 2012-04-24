require 'minitest/autorun'
require "active_support/all"

describe nil do
	it "must be blank" do
		nil.blank?.must_equal true
	end
end
