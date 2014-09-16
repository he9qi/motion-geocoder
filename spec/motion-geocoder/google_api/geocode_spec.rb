describe "Google Geocode API " do
  extend WebStub::SpecHelpers

  before do
    disable_network_access!
    MotionGeocoder::GoogleApi.register "key"

    @res_zero    = File.read NSBundle.mainBundle.resourcePath.stringByAppendingPathComponent("geo_address_zero.json")
    @res_denied  = File.read NSBundle.mainBundle.resourcePath.stringByAppendingPathComponent("geo_address_denied.json")
    @res_success = File.read NSBundle.mainBundle.resourcePath.stringByAppendingPathComponent("geo_address.json")
    @url         = MotionGeocoder::GoogleApi::Geocode.reverse_geo_url(0,0)
  end

  it "generates reverse geo url" do
    @url.should == "https://maps.googleapis.com/maps/api/geocode/json?latlng=0,0&key=key"
  end

  it "denied when using invalid API key" do
    stub_request(:get, @url).to_return(json: @res_denied)

    MotionGeocoder::GoogleApi::Geocode.(0,0) do |res|
      @res = res
      resume
    end

    wait_max 1.0 do
      @res.should == nil
    end

  end

  it "returns zero addresses" do
    stub_request(:get, @url).to_return(json: @res_zero)

    MotionGeocoder::GoogleApi::Geocode.(0,0) do |res|
      @res = res
      resume
    end

    wait_max 1.0 do
      @res.should == nil
    end

  end

  it "returns real address" do
    stub_request(:get, @url).to_return(json: @res_success)

    MotionGeocoder::GoogleApi::Geocode.(0,0) do |res|
      @res = res
      resume
    end

    wait_max 1.0 do
      @res.should == "1800 Ellis Street, San Francisco, CA 94115, USA"
    end

  end

end
