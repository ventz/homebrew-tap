cask "wombat-wireguard" do
  version "1.2.0"
  sha256 "3530f0ddfa0b43e833b21d271e11585361bda28300a33335c0114886a6f8c1c7"

  url "https://wombat.vpetkov.net/Wombat-#{version}.dmg"
  name "Wombat"
  desc "Native WireGuard, AmneziaWG and Cisco AnyConnect client"
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
    Your first Cisco AnyConnect VPN asks once more, for "Wombat OpenConnect".
    Tunnel configurations live in System Settings > VPN; remove them there
    before uninstalling if you no longer need them.
  EOS
end
