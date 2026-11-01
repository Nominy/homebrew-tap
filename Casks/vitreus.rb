cask "vitreus" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "692a08fb7248ee50cd21b8000a8399f8db297e40044816a07c002d6f050d6591",
         intel: "be98ebf542fc6356950fd54a136acaa49caccf087384061eda38c7596b5b26fe"

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
