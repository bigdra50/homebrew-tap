cask "otolog" do
  version "0.3.0"
  sha256 "1853457f6f98a38c2d3560ce346243caf7de7b36bc6ee9baefc8af5becc0064e"

  url "https://github.com/bigdra50/OtoLog/releases/download/v#{version}/OtoLog.zip"
  name "OtoLog"
  desc "Menu bar app that transcribes Mac system audio in real time"
  homepage "https://github.com/bigdra50/OtoLog"

  depends_on macos: :tahoe # macOS 26+ (SpeechAnalyzer)

  app "OtoLog.app"

  # ad-hoc signed and not notarized: strip the quarantine attribute Homebrew adds
  # so Gatekeeper does not block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OtoLog.app"]
  end
end
