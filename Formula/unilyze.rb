# Release automation renders the placeholders below, attaches the rendered
# formula to each GitHub Release, and pushes it to
# bigdra50/homebrew-tap (Formula/unilyze.rb) when HOMEBREW_TAP_TOKEN is set.
class Unilyze < Formula
  desc "Static analyzer for Unity and general C# projects"
  homepage "https://github.com/bigdra50/unilyze"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bigdra50/unilyze/releases/download/v0.5.1/unilyze-0.5.1-osx-arm64.tar.gz"
      sha256 "097ca4fe0830a18514998063e6dcd57519769c3f5c9b85fd3f7e8f6f240ee19c"
    else
      url "https://github.com/bigdra50/unilyze/releases/download/v0.5.1/unilyze-0.5.1-osx-x64.tar.gz"
      sha256 "71cba56b7d271573ae5eb048c17f6fdb1ad4e3b3be658d1f919be16097a3e409"
    end
  end

  on_linux do
    url "https://github.com/bigdra50/unilyze/releases/download/v0.5.1/unilyze-0.5.1-linux-x64.tar.gz"
    sha256 "e9b9bbcf3f6dd6710034be011ef7f7efe01a88c8ad912092f6d4a54e9fa6b1b9"
  end

  def install
    bin.install "unilyze"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unilyze --version")
  end
end
