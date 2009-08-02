require File.expand_path(File.join(File.dirname(__FILE__),'..','..','test_helper')) 

class NewRelic::Agent::NetInstrumentationTest < Test::Unit::TestCase
  
  def setup
    NewRelic::Agent.manual_start
    @engine = NewRelic::Agent.instance.stats_engine
    @engine.clear_stats
  end
  def test_get
    url = URI.parse('http://www.google.com/index.html')
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.get('/index.html')
    }
    assert_match /<head>/, res.body
    assert_equal @engine.metrics.sort, 
       %w[External/www.google.com/Net::HTTP/GET External/all External/www.google.com/all].sort
  end
  def test_get__simple
    Net::HTTP.get URI.parse('http://www.google.com/index.html')
    assert_equal @engine.metrics.sort, 
       %w[External/www.google.com/Net::HTTP/GET External/all External/www.google.com/all].sort
  end
  def test_head
    url = URI.parse('http://www.google.com/index.html')
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.head('/index.html')
    }
    assert_equal %w[External/www.google.com/Net::HTTP/HEAD External/all External/www.google.com/all].sort,
       @engine.metrics.sort 
  end
  
  def test_post
    url = URI.parse('http://www.google.com/index.html')
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.post('/index.html','data')
    }
    assert_equal %w[External/www.google.com/Net::HTTP/POST External/all External/www.google.com/all].sort, 
        @engine.metrics.sort 
  end
  
end
