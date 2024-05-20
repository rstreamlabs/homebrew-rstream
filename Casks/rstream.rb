cask "rstream" do
  name "rstream"
  desc "Powerful Tunnels for Modern Applications."
  homepage "https://rstream.io"
  version "0.0.48"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://rstream.io/api/packages/664b897f9216a6ec08d9734e/download",
        sha256: "34da469d903dede926ac91654dd8dda08d3f6e843179f0968c1c5dd6f5dd1b31",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/664b898036ba0164760d9908/download",
        sha256: "c79b231b4be23e939d0afebd035d57d5f7b0c80c54ced9fa51fc24fd9ba2704a",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://rstream.io/api/packages/664b898236ba0164760d990d/download",
        sha256: "c9288dbb0501be608e07b3a441e21836c70ffa3e10fd574dadc15225d427afc4",
      },
      "arm64" => {
        url: "https://rstream.io/api/packages/664b898336ba0164760d9910/download",
        sha256: "c181af910adbb79e8eb1fdabf932dfbaff4724e2b7beed2e1c25b7ba4a977305",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
