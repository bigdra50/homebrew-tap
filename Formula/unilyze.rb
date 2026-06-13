# Pushed by the unilyze release workflow (Update Homebrew tap step).
# Do not edit by hand; changes are overwritten on the next release.
class Unilyze < Formula
  desc "Static analyzer for Unity and general C# projects"
  homepage "https://github.com/bigdra50/unilyze"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bigdra50/unilyze/releases/download/v0.4.1/unilyze-0.4.1-osx-arm64.tar.gz"
      sha256 "cfd906c8c984eb4f9317420f22384e66cf72bc77a2b00be5aea7dcf37ca3b38c"
    else
      url "https://github.com/bigdra50/unilyze/releases/download/v0.4.1/unilyze-0.4.1-osx-x64.tar.gz"
      sha256 "44bf8ac159630af5e0c3de550267fbc3697fecb2ea7f06b0aedf155ff7631df6"
    end
  end

  on_linux do
    url "https://github.com/bigdra50/unilyze/releases/download/v0.4.1/unilyze-0.4.1-linux-x64.tar.gz"
    sha256 "25b4caa9de94c9803b270df8c7fe9f48c234def79a046dda31b7b4ae52a09bdd"
  end

  def install
    bin.install "unilyze"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/unilyze --version")
  end
end
