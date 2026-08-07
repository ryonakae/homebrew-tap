cask "sheltie" do
  version "1.2.0"
  sha256 "6192204e7722db46f015a8a94e744cd326db44c622b54130d452b2be3b0dcfa1"

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
