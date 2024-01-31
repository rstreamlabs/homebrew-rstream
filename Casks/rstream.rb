cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.41"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9ef23539ff8c7671b3c19/download",
        sha256: "aacc1de2d8e63c575f8ac48351c838abb9c5707b4dff595ceeb0fdaf0bbbf5f9",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9ef26be2c2854e817ded8/download",
        sha256: "cd9112a1284f2a6c5aa03648d233778c294cdfaf6f1bf351979b5301ee96204c",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9ef2a539ff8c7671b3c1f/download",
        sha256: "c5918505a3ff774a5a9ea6ddee7a75804f05d77178ed0aa176ca81b8788cd02a",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9ef2b539ff8c7671b3c20/download",
        sha256: "13b2209e759bf7c4e65aaea69181d27de4be6c8f26945c5bedcbca703290a48e",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
