describe "Google Place API " do
  extend WebStub::SpecHelpers

  before do
    disable_network_access!
    MotionGeocoder::GoogleApi.register "key"

    @res_zero    = File.read NSBundle.mainBundle.resourcePath.stringByAppendingPathComponent("geo_place_zero.json")
    @res_denied  = File.read NSBundle.mainBundle.resourcePath.stringByAppendingPathComponent("geo_place_denied.json")
    @res_success = File.read NSBundle.mainBundle.resourcePath.stringByAppendingPathComponent("geo_place.json")
    @url         = MotionGeocoder::GoogleApi::Place.auto_complete_url(1)
  end

  it "denied when using invalid API key" do
    stub_request(:get, @url).to_return(json: @res_denied)

    MotionGeocoder::GoogleApi::Place.auto_complete(1) do |res|
      @res = res
      resume
    end

    wait_max 1.0 do
      @res.should == []
    end

  end

  it "returns zero addresses" do
    stub_request(:get, @url).to_return(json: @res_zero)

    MotionGeocoder::GoogleApi::Place.auto_complete(1) do |res|
      @res = res
      resume
    end

    wait_max 1.0 do
      @res.should == []
    end

  end

  it "returns real address" do
    stub_request(:get, @url).to_return(json: @res_success)

    MotionGeocoder::GoogleApi::Place.auto_complete(1) do |res|
      @res = res
      resume
    end

    wait_max 1.0 do
      @res[0][:address].should == "1155 College View Drive, Monterey Park, CA, United States"
    end

  end

end
