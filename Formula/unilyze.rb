# Release automation renders the placeholders below, attaches the rendered
# formula to each GitHub Release, and pushes it to
# bigdra50/homebrew-tap (Formula/unilyze.rb) when HOMEBREW_TAP_TOKEN is set.
class Unilyze < Formula
  desc "Static analyzer for Unity and general C# projects"
  homepage "https://github.com/bigdra50/unilyze"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bigdra50/unilyze/releases/download/v0.6.1/unilyze-0.6.1-osx-arm64.tar.gz"
      sha256 "7c76c306a4e9ca557b19f35d798b9c930d584b18467268b9f57eff93a2014400"
    else
      url "https://github.com/bigdra50/unilyze/releases/download/v0.6.1/unilyze-0.6.1-osx-x64.tar.gz"
      sha256 "6afe392189f652aaa5a2af5d2b34f5a3bb363536aa5566104c76c6499217c9a9"
    end
  end

  on_linux do
    url "https://github.com/bigdra50/unilyze/releases/download/v0.6.1/unilyze-0.6.1-linux-x64.tar.gz"
    sha256 "1eba7fe336b6b3d37562f768a82d1bea1968dbb949c88a3587238952295c501e"
  end

  def install
    bin.install "unilyze"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unilyze --version")
  end
end
