cask "rstream" do
  name "rstream"
  desc "Powerful Tunnels for Modern Applications."
  homepage "https://rstream.io"
  version "0.0.51"
  os = OS.mac? ? "macos" : "linux"
  arch = Hardware::CPU.intel? ? "x86_64" : "arm64"
  packages = {
    "macos" => {
      "x86_64" => {
        url: "https://rstream.io/api/packages/667a5cf359f6517052cef7dc/download",
        sha256: "cbb03b9d7a4459aea2b2eb01a27d8c6f77b1396b8d7abae766a0893c790da276",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/667a5cf759f6517052cef7e0/download",
        sha256: "eb16d945ce5b348823009ac8053e3bb1b7d461a83b39850c17445f85dfe2c971",
      }
    },
    "linux" => {
      "x86_64" => {
        url: "https://rstream.io/api/packages/667a5d0459f6517052cef7ef/download",
        sha256: "c609b4cb295058208d6871c68dfeb84f36aaf775fc05e761ed728192b6520f85",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/667a5d0b59f6517052cef7f7/download",
        sha256: "fa96aee825de97473fd44d7baf2a620a473526c61b00e6280206133cfbb82cfa",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
