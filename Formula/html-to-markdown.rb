# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.17"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.17"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b10ef90feef1bb336f48fd8820a20b72d8deedcb335fde3e8b10e0f7efa03aea"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64ded101f1ce4c98c3cb4aa7a3798191805d96d5fa02aa47a5541180f5d8fd3a"
    sha256 cellar: :any_skip_relocation, sequoia: "42801fcd2930843b17c6ffe43a127f17b77dd5cf3b2cb5349b70a9342c479bb8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7675576bf3f12bfc81d571351a92ec6ec15e4f8a233c6f2c92484e5037ae9900"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "80a047657748435781edc5588688f3a758042fa469ec8efcb6dc0de08d59b963"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "b7e946be6ab679c5927e78f13997cc3ea2cf049b4a4d90b87f58fcea5e436e86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46152034d40b06b56d6566ae66a495435b5708114a70c8aee62dc1a27e8e36dc"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbe39bd006770973ded28e4e5aae57559aee42b81b93caed88bdd9fc3e6ee192"
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
