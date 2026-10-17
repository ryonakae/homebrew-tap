cask "strata-menubar" do
  version "0.1.0"
  sha256 "31ad056a673b8bd7f7c6eb42020d7a49c5884b8a09e0682cafa2fb1c8a7113df"

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
