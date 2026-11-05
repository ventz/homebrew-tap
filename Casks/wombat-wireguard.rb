cask "wombat-wireguard" do
  version "1.4.1"
  sha256 "325bfb7d2d30666375359585b28ae522d8442aca075431de86ae74a14514c0e9"

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
  bash_completion "#{appdir}/Wombat.app/Contents/Resources/completions/wombat.bash"
  zsh_completion "#{appdir}/Wombat.app/Contents/Resources/completions/_wombat"
  fish_completion "#{appdir}/Wombat.app/Contents/Resources/completions/wombat.fish"

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
