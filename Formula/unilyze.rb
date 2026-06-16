# Release automation renders the placeholders below, attaches the rendered
# formula to each GitHub Release, and pushes it to
# bigdra50/homebrew-tap (Formula/unilyze.rb) when HOMEBREW_TAP_TOKEN is set.
class Unilyze < Formula
  desc "Static analyzer for Unity and general C# projects"
  homepage "https://github.com/bigdra50/unilyze"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bigdra50/unilyze/releases/download/v0.5.3/unilyze-0.5.3-osx-arm64.tar.gz"
      sha256 "a87b39939aaa230f2afb811ac252915d4f4a16525ba31fb42ea94747b1849131"
    else
      url "https://github.com/bigdra50/unilyze/releases/download/v0.5.3/unilyze-0.5.3-osx-x64.tar.gz"
      sha256 "a8d54c97d883daa0fd888d182601d2bffa54931e79472d2c785518661d1e9a29"
    end
  end

  on_linux do
    url "https://github.com/bigdra50/unilyze/releases/download/v0.5.3/unilyze-0.5.3-linux-x64.tar.gz"
    sha256 "7038e82b58354764fc28495021db66004674455b8d9db85872389aeb9c3cede1"
  end

  def install
    bin.install "unilyze"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unilyze --version")
  end
end
