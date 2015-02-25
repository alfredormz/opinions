class OpinionCollection
  include Enumerable

  @@memoized_opinions = {}

  def initialize(year=Date.today.year, month=Date.today.month)
    @year = year
    @month = month
  end

  def each
    return to_enum(__callee__) unless block_given?
    
    opinions.each do |opinion|
      yield opinion
    end
  end

  def to_a
    opinions
  end

  private

  def opinions
    @@memoized_opinions.fetch(memo_key) do
      puts "Fetching from site: #{memo_key}"
      @@memoized_opinions[memo_key] = SiteParser.call(@year, @month)
    end
  end

  def memo_key
    [@year, @month].join(":")
  end
end
