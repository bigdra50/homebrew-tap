cask "otolog" do
  version "0.2.0"
  sha256 "87f4bcf0f766d2b35443a2f3b8095760dcc149c0d68bf6d6f5b9f9f18a4f359e"

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
