require 'thor'
require 'active_support/all'

Dir[File.dirname(__FILE__) + '/bernard/*.rb'].each { |e| require e }

module Bernard

  class CLI < Thor
    desc "reports SUBCOMMAND ...ARGS", "upload and process reports"
    subcommand "reports", Bernard::Reports
  end

end