# Release automation renders the placeholders below, attaches the rendered
# formula to each GitHub Release, and pushes it to
# bigdra50/homebrew-tap (Formula/ccstatuskit.rb) when HOMEBREW_TAP_DEPLOY_KEY is set.
class Ccstatuskit < Formula
  desc "Modular statusline kit for Claude Code"
  homepage "https://github.com/bigdra50/ccstatuskit"
  version "0.2.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bigdra50/ccstatuskit/releases/download/v0.2.1/ccstatuskit-aarch64-apple-darwin.tar.gz"
      sha256 "170b907904042c2bcc35f08d6974963da0ffcac1b894e244eeb52b47b638cf4a"
    else
      url "https://github.com/bigdra50/ccstatuskit/releases/download/v0.2.1/ccstatuskit-x86_64-apple-darwin.tar.gz"
      sha256 "012e32baa8a4f678705f8508b02dc2934e904824b9ab4d852f67ac7076fffc20"
    end
  end

  on_linux do
    url "https://github.com/bigdra50/ccstatuskit/releases/download/v0.2.1/ccstatuskit-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "abfc29c6803cea0fa08407f08013c97e4a41ac2f5e58bbbe91fee99cb70131c4"
  end

  def install
    bin.install "ccstatuskit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccstatuskit --version")
  end
end
