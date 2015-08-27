require 'rubygems'
require 'geminabox'
require 'tilt/erb'

require_relative 'lib/auth'

Geminabox.data = '/srv/gems'
Geminabox.rubygems_proxy = true # Allow pulling gems from another gem source.
Geminabox.allow_remote_failure = true # Serve gems if upstream source is down.

use Rack::Auth::Basic do |_, token|
  Auth::GitHub.authorized?(token)
end if ENV['GITHUB_AUTH_ENABLED']

run Geminabox::Server
