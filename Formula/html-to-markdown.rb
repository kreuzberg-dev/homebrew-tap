# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.16"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.16"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2f2ddd8d0f8120d02605e462cd5ca5bb73cafd03ff66b514a14a8c8515411202"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "09d1df2fdd081c09da3522fa6f74ab9853bbe8b3894259db23310bd4ab774e8f"
    sha256 cellar: :any_skip_relocation, sequoia: "967ccdc405b057faf35d7b4ebb6020dca59974a6d0d119638cea113336cbfee8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "30352a672d0caf0ccce464d060577bbd9572bf52eccd8ec1c35c90d89012803c"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "060a0f745bb609421b110b57e7dba749b138b36d1fcc211d364119baa99c658c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "0ed409b720e66313be6785d4ade957f6214363ba6d139471feb6c8df9b572f86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b682846a90b47e267ea7d1ed1d54b9187c4c117c18b0fac63f491d7958e62a89"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8a10a9abd7dec0d24f9a7787026449d75978454ebc5bd246bcd27ec9bdc6d64"
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
