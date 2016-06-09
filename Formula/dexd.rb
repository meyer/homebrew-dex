class Dexd < Formula
  desc "Hack the planet!"
  homepage "https://github.com/meyer/dex"
  head "https://github.com/meyer/dex.git"

  def install
    bin.install "build/dexd"
  end

  plist_options :manual => "dexd -cert_dir=#{HOMEBREW_PREFIX}/var/dexd"

  def plist
    <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>

        <key>KeepAlive</key>
        <true/>

        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/dexd</string>
          <string>-cert_dir</string>
          <string>#{var}/dexd</string>
        </array>

        <key>StandardOutPath</key>
        <string>#{var}/dexd/stdout.log</string>

        <key>StandardErrorPath</key>
        <string>#{var}/dexd/stderr.log</string>

        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>

        <key>RunAtLoad</key>
        <true/>
      </dict>
    </plist>
    EOS
  end

  def caveats
    <<-EOS.undent
      Create or symlink a directory in which dex modules will be stored:
        mkdir -p ~/Dropbox/dexfiles
        ln -s ~/Dropbox/dexfiles ~/.dex

      dexd won’t start unless a folder or valid symlink is found at ~/.dex

      Running dexd as a service is The Best Way, but if you want to do things
      yourself, you’ll need to provide a cert_dir parameter. A self-signed
      SSL certificate will be generated on first run and saved to cert_dir.

      I could go on, but you’d probably have a nicer time reading the README:
      https://github.com/meyer/dex/blob/master/README.md
    EOS
  end
end
