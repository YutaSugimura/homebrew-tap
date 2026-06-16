cask "gmaps" do
  arch arm: "arm64"

  version "0.1.1"
  sha256 "3f301e44370969cb268279af6b8a559debfc2ffae66a257aab0f2dd15eb5805c"

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
