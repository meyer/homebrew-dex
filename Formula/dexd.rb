class Dexd < Formula
  desc "Hack the planet!"
  homepage "https://github.com/meyer/dex"
  head "https://github.com/meyer/dex.git"

  def install
    bin.install "build/dexd"
  end

  def caveats
    <<-EOS.undent
      Create or symlink a directory in which dex modules will be stored:
        mkdir -p ~/Dropbox/dexfiles
        ln -s ~/Dropbox/dexfiles ~/.dex

      Write dexd launchagent to ~/Library/LaunchAgents:
        dexd -install

      Set dexd to start on boot:
        launchctl load -w ~/Library/LaunchAgents/fm.meyer.dex.plist
    EOS
  end
end
