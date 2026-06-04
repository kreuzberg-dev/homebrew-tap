# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.9"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.9"
    sha256 cellar: :any_skip_relocation, arm64_linux: "32bf8f1483392189f7b95e4c5d32024c19271d22e2b8f507584405fb6619c33c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f08dcb0c6a472e15ff33b8d5fd56b8a67cce0656d07ee84d09796b22c34c8f25"
    sha256 cellar: :any_skip_relocation, sequoia: "60f606b4c4d4584a124c9bd60f77fd320b0e3d59659f3f3344051cbf84bd1585"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e0c36c5b54b9ee3401db03a31061e5a3b7b5d1a1e1c7d19e7eaf2db6ba6fd9a9"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "c61253ec5cd1ed0a75d0b5582eaa0086658139d290ecf9228bbad02e36e6433c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "64737ee65c55801031efed64372c607bb4de10c2b361de55e4a85fa04c095530"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ea68e601f4194837d8158decb7e7fc6f2a1eedc490a0ffbf0e4635d17940d4d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9d7239d2392671f2ed20abb8a87656eecddd35f501044ded859f043d69f1e85"
    end
  end

  def install
    bin.install "html-to-markdown"
  end

  test do
    (testpath / "test.html").write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
  end
end
