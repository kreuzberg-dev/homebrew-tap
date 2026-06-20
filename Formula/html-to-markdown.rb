# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.18"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.18"
    sha256 cellar: :any_skip_relocation, arm64_linux: "cb86105aaa6bc6cdb02f1ef079ae4c94d0e9b14de2f2be1caa40cb19b9d8139b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9862574d7219d1e56730410ca0de4abe3dd85f1a136f0b17539ed5002f1296a2"
    sha256 cellar: :any_skip_relocation, sequoia: "4df910b3e625942caacc3ac8a82a01f9ec69351035ab439bcfbb4596c412e521"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0308d2f3b6db4750aee24b058b4e8e115dab53184c0356fe19cec3b081ae480"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "3fdb96ad2282ad1b83ddfa9ae672c5d521ba003a2e04b28a73c7a68c24715c66"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "59915cfc1596c22feb7a9dcc7b1944399e9ac2061650a51eb0ef3ebbd6f365ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad42714029869b886b2c0b329dc51305e57191770da93c112a0530f94540c7e6"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c834664cf820b92a0da52e30f6737f543bda9cce744532d5eab3c092bff8866"
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
