cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.20"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a013151c163c89dc97c524/download",
        sha256: "4cf9a3d3d83162244cdaebfdd04b127f9b50d34fefe39e4a98125566aa0637a0",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a01318269617177ba74562/download",
        sha256: "1922929e973e9e25ca0e1e1b66fa61b24367f16b81a73164317623c95d64042e",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a0131f269617177ba74565/download",
        sha256: "b56591a4b856c6f8928637f11e61b905ac42caa7bf066cc53aabb9b278702c1d",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a01322269617177ba74568/download",
        sha256: "f90e29470f014c2f8ecbb1f5794d6dc645d82c9c506bb25bc23f4dc137e8d8c6",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
