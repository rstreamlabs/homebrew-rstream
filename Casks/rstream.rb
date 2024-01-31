cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.42"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65ba4a2bd22ae84838d2dd29/download",
        sha256: "00d0ee5f3c4cf03a77761b313c40e1d8942a5f5ce18d5515a38ca1b891e33668",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65ba4a2f1ba3725f38dc5035/download",
        sha256: "51db212d2a92f937f16cf117064dd2d4d86fd8745bdb887bdf16223a5fccf0a8",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65ba4a32d22ae84838d2dd2f/download",
        sha256: "44352cb55a7c873973acfdef265944bcfde5ccfec5f434e1d8653d622913e816",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65ba4a33d22ae84838d2dd30/download",
        sha256: "5fb887a0dc3fbc708ec17bfefe110261e2d30220899cdf0c2ee895381151beb2",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
