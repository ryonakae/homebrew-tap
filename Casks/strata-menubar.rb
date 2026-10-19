cask "strata-menubar" do
  version "0.2.0"
  sha256 "04853879f986f3f29f75c070f703d145e627f5dd3ded5d8cb6a7c0c74be99820"

  url "https://github.com/ryonakae/strata-menubar/releases/download/v#{version}/StrataMenubar_#{version}_arm64.dmg"
  name "StrataMenubar"
  desc "Menu bar app to start, stop and configure a local Strata LLM server"
  homepage "https://github.com/ryonakae/strata-menubar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

  app "StrataMenubar.app"

  zap trash: [
    "~/Library/Application Support/StrataMenubar",
    "~/Library/Logs/StrataMenubar",
    "~/Library/Preferences/com.ryonakae.StrataMenubar.plist",
  ]
end
