# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.9"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "5544a8a7a9bcfb74ab7e425565eb8d1b868493f6476776a22f532fd124568237"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bc95e8524ca8b4ebe3fd9278f40c398a844ee001c5ed7c2d1e9a121bba651e16"
    sha256 cellar: :any_skip_relocation, sequoia: "f4756f65619e59f6d13dfeddec499aa4a0c988052aa2f205f6b243b326f09bb6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c4f0f1a4fdac19d658721a416bd7c07cebb5f437bfe4789949c8321e556c1e82"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "6819744331ff059e34d5362df5bd5d713e4ac925f7bfcee7c0ae5a1d6153303f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "8772bd99f61f233e3742ede83aec0c2499ca1f5f81acbd85d7159fe4b91940da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ea929254caa72f133d6a60a9506368624fb8c9d983c26f4bae735dcec1aae56"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f709e20ffc0f72ba4061fee7105db49710282eff7d3fea3afb031a4fbac0263"
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
