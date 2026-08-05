cask "sheltie" do
  version "1.0.0"
  sha256 "5a27429a348d9b3b2ccadd71a98d3bf1f41773e994aebe198436d6e379d380f5"

  url "https://github.com/ryonakae/sheltie/releases/download/v#{version}/Sheltie_#{version}_universal.dmg"
  name "Sheltie"
  desc "Arrange live web pages on an infinite canvas and review them like artboards"
  homepage "https://github.com/ryonakae/sheltie"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Sheltie.app"

  zap trash: [
    "~/Library/Application Support/jp.brdr.app.sheltie",
    "~/Library/Caches/jp.brdr.app.sheltie",
    "~/Library/Preferences/jp.brdr.app.sheltie.plist",
    "~/Library/WebKit/jp.brdr.app.sheltie",
  ]
end
