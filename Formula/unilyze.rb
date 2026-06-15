# Release automation renders the placeholders below, attaches the rendered
# formula to each GitHub Release, and pushes it to
# bigdra50/homebrew-tap (Formula/unilyze.rb) when HOMEBREW_TAP_TOKEN is set.
class Unilyze < Formula
  desc "Static analyzer for Unity and general C# projects"
  homepage "https://github.com/bigdra50/unilyze"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bigdra50/unilyze/releases/download/v0.5.2/unilyze-0.5.2-osx-arm64.tar.gz"
      sha256 "c80f6c137cc333d09f18d76f604af6061fdec0099a548d68aab6c2009d478853"
    else
      url "https://github.com/bigdra50/unilyze/releases/download/v0.5.2/unilyze-0.5.2-osx-x64.tar.gz"
      sha256 "5ba6376299151c6df96690b0b2f15811aab5268cf9807329c798268b742439a8"
    end
  end

  on_linux do
    url "https://github.com/bigdra50/unilyze/releases/download/v0.5.2/unilyze-0.5.2-linux-x64.tar.gz"
    sha256 "4a2ea0502eb5650517e68ab30b273fc6dbf1d98263eb2bfe27a679ff842e00de"
  end

  def install
    bin.install "unilyze"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unilyze --version")
  end
end
