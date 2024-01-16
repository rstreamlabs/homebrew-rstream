cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.33"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a6ae135f7d560f58c4fbb7/download",
        sha256: "a0b8dc54c233071fd9da39a0a1a62337081091ef3d74a3f015f1edd576f7141f",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a6ae16dcf046e6abeddf31/download",
        sha256: "866f6ff5f156d49011716b9295e63c17a5480e5f4b37002509ab870eb8a2de45",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a6ae1a5f7d560f58c4fbbd/download",
        sha256: "48993b060b263c26c052358169f1e480b0db1c96c0c021e9b7348957e0dacaf1",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a6ae1c5f7d560f58c4fbbe/download",
        sha256: "3b8c60f4a8f7ba02e172c014061b336c4aad36a0314172bec9140acd51a12186",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
