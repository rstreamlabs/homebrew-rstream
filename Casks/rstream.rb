cask "rstream" do
  name "rstream"
  desc "secure, scalable, and sovereign networking for the modern enterprise."
  homepage "https://rstream.io"
  version "0.0.40"
  os = OS.mac? ? "darwin" : "linux"
  arch = Hardware::CPU.intel? ? "amd64" : "arm64"
  packages = {
    "darwin" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9ece9ca903b897f048cc9/download",
        sha256: "4adc4a508aa78572afe5aec0623fefdc6f5fd796da5a8179580010a0755d09d7",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9ece9539ff8c7671b3c06/download",
        sha256: "a2dbe49f1cdb339435d9e370147b7629297eb542eba4f14796e30d7460e6df80",
      }
    },
    "linux" => {
      "amd64" => {
        url: "https://dev.rstream.io/api/packages/65b9ecee539ff8c7671b3c0a/download",
        sha256: "cc73e3e8652ff33abe0adabc4b2c3163b2924f23560d4a9985662507f6133728",
      },
      "arm64" => {
        url: "https://dev.rstream.io/api/packages/65b9ecf0539ff8c7671b3c0b/download",
        sha256: "bdbca6b3e2c52ca32d8587d70e373e6a1ab0d5bf9376d4aa7ffcb749269a63a4",
      }
    }
  }
  package = packages[os][arch]
  url package[:url]
  sha256 package[:sha256]
  binary "bin/rstream"
  zap trash: "~/.rstream"
end
