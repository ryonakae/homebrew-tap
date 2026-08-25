class Zerdr < Formula
  desc "Keep Herdr sessions aligned with their Git checkouts in Zed"
  homepage "https://github.com/ryonakae/zerdr"
  version "0.5.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.5.1/zerdr-aarch64-apple-darwin.tar.xz"
      sha256 "8c9de285a1305965ddec0fc4330823454fb825f5877925b3a14c907b87287537"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.5.1/zerdr-x86_64-apple-darwin.tar.xz"
      sha256 "4ceec878a6f2c4a7210d1ee76af8346bf7a4e47e7b4f33373c584f2102c27c69"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.5.1/zerdr-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1d5745c530766942a7f394f4d8728b5d1b9993d5412bcd2cd7e5ac7ebccad475"
    end
    if Hardware::CPU.intel?
      url "https://github.com/ryonakae/zerdr/releases/download/v0.5.1/zerdr-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "67e38ef62b7d56c3e4b165d12529baa6faf586c981445c04f9f97e2b55d83336"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "zerdr"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "zerdr"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "zerdr"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "zerdr"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
