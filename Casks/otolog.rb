cask "otolog" do
  version "0.3.1"
  sha256 "4aae27d72eaa179045ed775ff1583bab2a1538cf19217a721d0066a1c7c2f51b"

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
