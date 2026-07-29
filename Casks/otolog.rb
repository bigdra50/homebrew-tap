cask "otolog" do
  version "0.1.0"
  sha256 "f36c2de02e669d05e87a63fc803b0caaaeb89da1ae292b805387de78a9db81b2"

  url "https://github.com/bigdra50/OtoLog/releases/download/v#{version}/OtoLog.zip"
  name "OtoLog"
  desc "Menu bar app that transcribes Mac system audio in real time"
  homepage "https://github.com/bigdra50/OtoLog"

  depends_on macos: ">= :tahoe" # macOS 26+ (SpeechAnalyzer)

  app "OtoLog.app"

  # ad-hoc signed and not notarized: strip the quarantine attribute Homebrew adds
  # so Gatekeeper does not block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/OtoLog.app"]
  end
end
