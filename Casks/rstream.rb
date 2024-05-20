cask "rstream" do
  name "rstream"
  desc "Powerful Tunnels for Modern Applications."
  homepage "https://rstream.io"
  version "0.0.49"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://rstream.io/api/packages/664bb06238f64947c5e6872c/download",
        sha256: "45e5a9555fd7797bc0e2ccc7c899b62aeaf7698d9f030d2254836e9e6b300d47",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/664bb06238f64947c5e6872d/download",
        sha256: "cc8e1f0c56bf43c2f1d3b9a38652dbe8ec25e9b529d87e92bc2d3c4cd208d5f8",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://rstream.io/api/packages/664bb06538f64947c5e68735/download",
        sha256: "26423a43bd91d2c588081cd55cadc04767adcdd8779a2a2ee34f9005818b514d",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/664bb06638f64947c5e68738/download",
        sha256: "4f0e653739c4db61c6af02e8926a98d0cb374a22eae156b951447710e297bcd5",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
