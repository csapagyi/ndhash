require 'spec_helper'

describe NDHash do

  describe 'count_levels' do

    it 'should count nesting level of hash' do
      expect(NDHash.count_levels({})).to eql(1)
      expect(NDHash.count_levels({hi: 'there'})).to eql(1)
      expect(NDHash.count_levels({hash: {}})).to eql(2)
      expect(NDHash.count_levels({many: {level: {hash: {}}}})).to eql(4)
      expect(NDHash.count_levels({many: {level: {hash: {}, multiple_keys: {}}}})).to eql(4)
      expect(NDHash.count_levels({many: {level: {hash: {}, multiple: {keys:{}}}}})).to eql(5)
      expect(NDHash.count_levels({many: {level: {hash: {}, multiple_keys: {key: 'value'}}}})).to eql(4)
    end

  end

  describe 'generate' do

    it 'should generate nesting depth according to level argument' do
      5.times do |n|
        levels = n+1
        hash = NDHash.generate(levels:levels, values_per_level:0, hashes_per_level:1)
        expect(NDHash.count_levels(hash)).to eql(levels)
      end
    end

    it 'should generate number of entries according to entries_per_level argument' do
      5.times do |n|
        hash = NDHash.generate(levels:1, values_per_level:n, hashes_per_level:1)
        expect(hash.count).to eql(n)
      end
    end

  end

end
