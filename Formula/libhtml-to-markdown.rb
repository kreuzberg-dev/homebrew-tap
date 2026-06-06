# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.17"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.17"
    sha256 cellar: :any_skip_relocation, arm64_linux: "d3701ef8e4c688859b4d913e43189c737ee8505263cd5c0cd35b71a27922b14b"
    sha256 cellar: :any, arm64_sequoia: "3700edf6b7da06ba37641c95e33190f03c51c7a894b2b43d345199f0bdf6b9aa"
    sha256 cellar: :any, sequoia: "6c9e174c87f40e081ebbafbdc9c405030d8ac5d69d3e607ced6676accce9af82"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "26d839ddd6588b3b7b7f4675982c86d4ad855fe7c05b7233206cee9fd0780fb2"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2b18b7bc533f9af4f064059e2fb6a98e9b1e202ce5924b02c10f1beb9fef1e59"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0185a8e4228ae887a4349c1137c1c03aa665ef561ee0e48d7b5b6afec0ff68ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62eaf03fbe863bc7fe6474d4ff62762811a88b8d997da49ca9f535c4d3177e26"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9aed300fc916531241f878c410325505ba06ae1aa89ac553c0a215b32e048810"
    end
  end

  def install
    include.install "include/html_to_markdown.h"

    if OS.mac?
      lib.install Dir["lib/*.dylib"]
    elsif OS.linux?
      lib.install Dir["lib/*.so"]
    end
    lib.install Dir["lib/*.a"]

    (lib / "pkgconfig").install "share/pkgconfig/html-to-markdown-rs.pc"

    inreplace lib / "pkgconfig/html-to-markdown-rs.pc", /prefix=.*/, "prefix=#{prefix}"

    (lib / "cmake/html-to-markdown-rs").install Dir["lib/cmake/html-to-markdown-rs/*"]
  end

  test do
    (testpath / "test.c").write <<~C
      #include <html_to_markdown.h>
      #include <stdio.h>
      int main(void) {
          const char *v = html_to_markdown_version();
          printf("html-to-markdown %s\\n", v);
          return v ? 0 : 1;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lhtml_to_markdown_ffi"
    assert_match version.to_s, shell_output("./test")
  end
end
