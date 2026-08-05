cask "sheltie" do
  version "1.1.0"
  sha256 "b8c72a86fec4df3f80abbfda1c8dd61fdb03cc6175022e147e875b3b09b6bd78"

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
