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
        sha256: "3dd89b7c760f5020dcf8edf4364d2621ad6b7e409409d329681762e88b4a4c8f",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a1dc79fe469264f9f8af52/download",
        sha256: "efe6283dab87bb22a4ab263e1b51ba21c5ce169caa756f4a9b58418efe5a9c24",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65a1dc8391359ad8e7482498/download",
        sha256: "bd67857f991d828797e8439818e5410cc2283e0e68c0d77411ddbd36b6b3885b",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65a1dc8691359ad8e7482499/download",
        sha256: "a76047d65c9ae3c917b72e761757d07b91a6d79289fbec62fa7547f6f5e30b31",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
