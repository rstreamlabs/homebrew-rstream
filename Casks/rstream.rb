cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.36"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9e1d351826581797f080f/download",
        sha256: "8fc1782d314560018bb46675bf9220bbfa13e87cdbaf1ad26c1d57b962a53a75",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9e1d6227fdfa48565ef28/download",
        sha256: "ae8d8a7b655f207d70d47544e39645ad0ced9646d1c9cf8f2abf3dfbd2be1139",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9e1d951826581797f0814/download",
        sha256: "ac4d19833cd6964131b27461968a3fdb454b85baf07e6eb754518b99be6a5940",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9e1dc227fdfa48565ef2d/download",
        sha256: "ecc622a91fc91803d587cae142147b9d00878d972674e8ea4f1bebcc636b12f5",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
