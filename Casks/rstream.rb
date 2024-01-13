cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.25"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a1dc77fe469264f9f8af51/download",
        sha256: "c4174dbbc5c115233c8e7f0b4eea3f0b35549bfafc8bb71736f8966b0acbf399",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a1dc79fe469264f9f8af52/download",
        sha256: "d6a07e7799158b14a44ba488a2676cb9f94dbbc826067185ab1a5d3a43ef5951",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a1dc8391359ad8e7482498/download",
        sha256: "2b681016383e5919e94b54036ef988a8026286d743f84db921af4034898f04de",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a1dc8691359ad8e7482499/download",
        sha256: "8fdfbf378094ff928938631f93fc56c8030c7c1fa71ade77a5341ac3774a9ab5",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
