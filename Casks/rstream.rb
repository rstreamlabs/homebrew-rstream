cask "rstream" do
  name "rstream"
  desc "Powerful Tunnels for Modern Applications."
  homepage "https://rstream.io"
  version "0.0.53"
  os = OS.mac? ? "macos" : "linux"
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"
  packages = {
    "macos" => {
      "x86_64" => {
        url: "https://rstream.io/api/packages/667a905217d2acaefa9ff890/download",
        sha256: "fedf9c046c45d6bedbd44154f5a6b1c765736fc8c7d29a4d7a0f5d7dbf10f003",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/667a905417d2acaefa9ff894/download",
        sha256: "a2c0da34ccc80889a0c2f6bff1de940c281888ea1acda3aee61c2982691c41f4",
      }
    },
    "linux" => {
      "x86_64" => {
        url: "https://rstream.io/api/packages/667a905a17d2acaefa9ff8a3/download",
        sha256: "8ab24f6e8507bf8782891450ace2a921bf32e79654663620997373d968d2f004",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/667a905c17d2acaefa9ff8ab/download",
        sha256: "0d9118b29ed28e329e007b58ca370aab52b7c3f61860c7cd4d29018453ba8ad0",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
