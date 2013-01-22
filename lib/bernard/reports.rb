require 'net/scp'

module Bernard
  class Reports < Thor

    desc 'adtech ~/Downloads/report', 'upload and import adtech reports'
    options yesterday: :boolean, aliases: :y
    options date: :string
    def adtech(report_path)
      puts "uploading #{report_path}"
      Net::SCP.upload!('greenservr.com', 'ryanfaerman', report_path, '/tmp') do|ch, name, sent, total|
        print "\r#{name}: #{(sent.to_f * 100 / total.to_f).to_i}%"
      end
      print "\n"
    end

  end
end