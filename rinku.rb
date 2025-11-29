# Homebrew formula for rinku
# Author: Alvaro Ramirez https://xenodium.com

class Rinku < Formula
  desc "A macOS command-line utility for fetching link previews and metadata from URLs"
  homepage "https://github.com/xenodium/rinku"
  url "https://github.com/xenodium/rinku/archive/refs/heads/main.tar.gz"
  version "1.0.8"
  license "GPL"

  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/rinku"
  end

  test do
    output = shell_output("#{bin}/rinku", 1)
    assert_match "Usage:", output
  end
end
