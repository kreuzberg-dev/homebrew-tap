# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.14"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.14"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c2aaa211e31bd8a979d0c8560d41053d56bead71b4d4156c5b83867572186ae8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2ac79a73375c3fe1a494c06819124ba9ceb4c042edc93d4da0e357920a4bcb08"
    sha256 cellar: :any_skip_relocation, sequoia: "f333d4b669547243164bbb0852c3a4b86cbc5c266d4a2a34479ab2e5566d26d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d187dab0422e1a2b0e1294a1d9e0103682725d34a328a9bf230cfadeff91c0bd"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "3fe00a7d5a70ffb16ca2e7e316f5219fd2520327835b06208ea5ac01b92f61ea"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "c5efc09a1fe9bc1659eb0c30106ec0318911c32b52a5fb652a37d662867249b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad0f00a52bc530777c9db2a472685dc266baba5db0fd9a4dffa0d62e306759b8"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d5273fe2f5631e254e6f823e4c5ca32b9bbb4a583bf16c59315ebce76d81f35"
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
