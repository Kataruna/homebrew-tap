cask "lemon" do
  version "0.4.0"
  sha256 "cc9eb890fe51e3ef8d126b8d01d1ceb1c998699361f9869ab454d7b54de4594e"

  url "https://github.com/Kataruna/Lemon/releases/download/mac-v#{version}/Lemon-#{version}-mac.zip"
  name "Lemon"
  desc "Drag-and-drop file converter with a wheel of formats"
  homepage "https://github.com/Kataruna/Lemon"

  # Mac and Windows are released separately; only mac-v… tags are Mac releases.
  livecheck do
    url :url
    regex(/^mac[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Lemon.app"

  uninstall quit: "com.sarabunari.lemon"

  zap trash: [
    "~/Library/Application Support/Lemon",
    "~/Library/Preferences/com.sarabunari.lemon.plist",
  ]

  caveats <<~EOS
    Lemon isn't notarized by Apple, so macOS blocks it the first time. Open it once, then
    System Settings › Privacy & Security › Open Anyway. Or run:
      xattr -dr com.apple.quarantine "#{appdir}/Lemon.app"

    Lemon uses free converters from Homebrew; its welcome guide offers to install them, or:
      brew install imagemagick ffmpeg pandoc ghostscript
      brew install --cask libreoffice
  EOS
end
