cask "gmaps" do
  arch arm: "arm64"

  version "0.1.3"
  sha256 "5958a7e331173b7ac0a6b3eb7ca7c54a6be22aca90834ca66e0c19f325427abd"

  url "https://github.com/YutaSugimura/gmaps-cli/releases/download/v#{version}/gmaps-#{version}-macos-#{arch}.app.zip"
  name "gmaps"
  desc "Google Maps Platform CLI (Geocoding, Places, Routes) with CoreLocation GPS"
  homepage "https://github.com/YutaSugimura/gmaps-cli"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "gmaps.app"
  binary "#{appdir}/gmaps.app/Contents/MacOS/gmaps"

  caveats <<~EOS
    gmaps lives inside gmaps.app because CoreLocation requires an app
    bundle, and the `gmaps` command is symlinked onto your PATH.

    On the first `gmaps -H` / `--here`, approve the Location Services
    prompt under System Settings > Privacy & Security > Location Services.
  EOS
end
