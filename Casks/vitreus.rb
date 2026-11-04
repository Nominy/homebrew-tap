cask "vitreus" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "c45c50c2c8060dd81093af73f63d2ab389a48bf4abf41bbb784afbbe05df52d2",
         intel: "56430387a1f6d978c23e955d6efc1541a0ed625b0e0d8d6033c3013cd5b48735"

  url "https://github.com/Nominy/vitreus/releases/download/v#{version}/vitreus-macos-#{arch}.tar.gz"
  name "Vitreus"
  desc "Fast, no-nonsense photo viewer"
  homepage "https://nominy.github.io/vitreus"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :catalina"

  app "Vitreus.app"
  binary "#{appdir}/Vitreus.app/Contents/MacOS/vitreus"

  # Ad-hoc signed, not notarized: drop the download quarantine so it opens.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Vitreus.app"]
  end

  zap trash: "~/Library/Application Support/Vitreus"
end
