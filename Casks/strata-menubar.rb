cask "strata-menubar" do
  version "0.1.1"
  sha256 "0c6692c3c83a1391056b1162c8112866435c09b26318d3608a9a61ad222b09c5"

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
