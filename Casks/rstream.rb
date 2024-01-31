cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.45"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65ba65dda0d29fe7e401c169/download",
        sha256: "1c0c44f613b14034b155659465746e44986d5f35433b4387a83efe974ea80bab",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65ba65e05d9f9b1ccc2335bc/download",
        sha256: "7fd336239ef04dd663f1ed3f41abe38493dbaa909dcf0b9c02e944046ea9ba49",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65ba65e45d9f9b1ccc2335bf/download",
        sha256: "a60d2abdb9e4db5b99b1eb8c3338d87684b4bb698681ce6d7457a4bfa149cd3d",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65ba65e6a0d29fe7e401c170/download",
        sha256: "e36181a6aa80a8200674dbb6867f79fe05146e751ec60c1a666de5cf1de3137d",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
