cask "antler" do
  version "0.6.0"
  sha256 "0c4371795ce95c647974ae0411b2d91da1ec3dc7693fb86b72c258e7b9bf1bb8"

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
