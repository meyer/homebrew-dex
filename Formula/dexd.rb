class Dexd < Formula
  desc "Hack the planet!"
  homepage "https://github.com/meyer/dex"
  head "https://github.com/meyer/dex.git"

  def install
    bin.install "build/dexd"
  end

  test do
    system "false"
  end
end
