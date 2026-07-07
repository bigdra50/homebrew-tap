# Release automation renders the placeholders below, attaches the rendered
# formula to each GitHub Release, and pushes it to
# bigdra50/homebrew-tap (Formula/unilyze.rb) when HOMEBREW_TAP_TOKEN is set.
class Unilyze < Formula
  desc "Static analyzer for Unity and general C# projects"
  homepage "https://github.com/bigdra50/unilyze"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bigdra50/unilyze/releases/download/v0.6.0/unilyze-0.6.0-osx-arm64.tar.gz"
      sha256 "98de5d68e5070ec721fdbe79d9ac243c916a4b3d552b6a3c3ab5742b78ae509b"
    else
      url "https://github.com/bigdra50/unilyze/releases/download/v0.6.0/unilyze-0.6.0-osx-x64.tar.gz"
      sha256 "6d410ca3944430531d574d5517c99681b0a13eebe01fad635d76b81e402fa786"
    end
  end

  on_linux do
    url "https://github.com/bigdra50/unilyze/releases/download/v0.6.0/unilyze-0.6.0-linux-x64.tar.gz"
    sha256 "8739e9805b996f4877d1ee983750a95417ff0d8942b6a6d266de1ba56b49677b"
  end

  def install
    bin.install "unilyze"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unilyze --version")
  end
end
