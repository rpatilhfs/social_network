OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '327554610669430', 'cc67fb7616c240499fb1c2f95acf930f'
  # => provider :twitter, YOUR_CONSUMER_KEY, YOUR_CONSUMER_SECRET
  # => provider :twitter, 'M2cNnSazf6S8aw2HPJXWPw', 'zQF1I8iEYw1p34wuYFEJpyEIujd2kjwJrrCqOn7bcw'

end

#OmniAuth.config.on_failure = Proc.new do |env|
#  new_path = "/auth/failure"
#  [302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
#end