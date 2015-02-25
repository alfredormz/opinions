class OpinionCollection
  include Enumerable

  def initialize(year=Date.today.year, month=Date.today.month)
    @year = year
    @month = month
  end

  def each
    return to_enum(__callee__) unless block_given?
    
    #TODO implement a memoization technique
    opinions = SiteParser.call(@year, @month)
    opinions.each do |opinion|
      yield opinion
    end
  end
end
