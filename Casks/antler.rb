cask "antler" do
  version "0.1.1"
  sha256 "43b30ccc79971e04c87a535f5b56b89654d56759f792c7cb3cf0d427c424f8ed"

  url "https://github.com/gianmadd/antler/releases/download/v#{version}/Antler-#{version}-arm64.zip"
  name "Antler"
  desc "Editor and diff viewer for folders with many git repositories"
  homepage "https://github.com/gianmadd/antler"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Antler.app"
  binary "#{appdir}/Antler.app/Contents/Resources/antler"

  caveats <<~EOS
    Antler is not notarized. On first launch macOS will block it: open
    System Settings -> Privacy & Security and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine /Applications/Antler.app
  EOS
end
