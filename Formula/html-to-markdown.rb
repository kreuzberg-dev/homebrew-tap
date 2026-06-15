# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.9"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.9"
    sha256 cellar: :any_skip_relocation, arm64_linux: "76d5cadee59487dd091661e426d805cdde9daa1b323c61ef5f90f3716a561512"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3a30ebd06202209ed414aa3a749860aa5ca5081bae7f6e4f3e1436ba1934a04f"
    sha256 cellar: :any_skip_relocation, sequoia: "44166d4b7c677cc658b1ebc41eb1cb24b6347ff4c0efd0a769c1a6f900bade8b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2fb3fe434298786c08d187888030a13b6a2e248ecf04c8fce57e94b8d68634e1"
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
