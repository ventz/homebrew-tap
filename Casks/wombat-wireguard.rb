cask "wombat-wireguard" do
  version "1.1.0"
  sha256 "8062bbbb361a39697fd8e6923e82d1dfde360e0a67af217905d8cbf1c81bc68a"

  url "https://wombat.vpetkov.net/Wombat-#{version}.dmg"
  name "Wombat"
  desc "Native WireGuard and AmneziaWG client"
  homepage "https://wombat.vpetkov.net/"

  livecheck do
    url "https://wombat.vpetkov.net/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Wombat.app"
  binary "#{appdir}/Wombat.app/Contents/Helpers/wombat"

  uninstall quit: "net.vpetkov.wombat"

  zap trash: [
    "~/Library/Containers/net.vpetkov.wombat",
    "~/Library/Group Containers/8J9W3ZG4ZN.net.vpetkov.wombat",
  ]

  caveats <<~EOS
    Open Wombat once and allow its network extension in
    System Settings > General > Login Items & Extensions.
    Tunnel configurations live in System Settings > VPN; remove them there
    before uninstalling if you no longer need them.
  EOS
end
