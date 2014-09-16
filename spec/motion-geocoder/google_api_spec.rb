describe MotionGeocoder::GoogleApi do

  it "should register key" do
    MotionGeocoder::GoogleApi.register("key")
    MotionGeocoder::GoogleApi.key.should == "key"
  end

end
