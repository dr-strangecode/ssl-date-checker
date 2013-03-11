# Note that this is a super dirty first run just to get something here - nothing here should be taken as 'good code'
module SslDateChecker

  class Settings
    require 'yaml'

    attr_reader :days_before_expire, :sites

    def initialize
      temp = YAML.load_file('config/config.yml')
      @sites = temp['sites']
      @days_before_expire = temp['days_threshold']
    end

  end

  class Cert
    require 'net/https'

    attr_reader :subject, :issuer, :serial, :not_before, :not_after

    def initialize(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host,uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.start do |h|
        cert = h.peer_cert
        @subject = cert.subject
        @issuer = cert.issuer
        @serial = cert.serial
        @not_before = cert.not_before
        @not_after = cert.not_after
      end
    end
    
  end

  class CertChecker

    class << self

      def check_cert(cert, days_before_expire)
        (cert.not_after.to_date - Date.today).to_i > days_before_expire.to_i
      end

    end

  end

  class Colorize

    class << self
 
      def colorize(text, color_code)
        "\e[#{color_code}m#{text}\e[0m"
      end

      def red(text); colorize(text, 31); end

      def green(text); colorize(text, 32); end

    end

  end

  settings = Settings.new

  puts "\n------------"
  settings.sites.each do |site|
    puts site
    cert = Cert.new(site)
    if CertChecker.check_cert(cert, settings.days_before_expire)
      puts Colorize.green("  #{(cert.not_after.to_date - Date.today).to_i} days before expiry.")
    else
      puts Colorize.red("  Will Expire in #{(cert.not_after.to_date - Date.today).to_i} days!")
    end
    puts "\n------------"
  end

end
