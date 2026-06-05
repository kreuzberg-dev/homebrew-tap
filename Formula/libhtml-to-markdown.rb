# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.14"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.14"
    sha256 cellar: :any_skip_relocation, arm64_linux: "acfe713f33893d30a47b2b73bcb0c6be9bf45351714c4fa1ccf17ace49bd4674"
    sha256 cellar: :any, arm64_sequoia: "939763025cde56d391e365c2a2862dc9e78bb4ade0e97ff8afa969f869de5aae"
    sha256 cellar: :any, sequoia: "e6515e437cbfce1788d59acf261ec3fa8a4d6f124b97c2ea63c9a5d1ea61e35b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3bf35792e5af07004c4c7e84cf7965f6651cf127cd596dc17f5a9ac58b29d8f0"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "35d67daad37665e8efdfbe5afa6197d032b14d67d826ba45701f66631640b6b2"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7290313b3ec61d9af170909ec41566c00dd7815321f05c1f33cbe6e4a63a423b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef1e20f844281a6d0f5c548072b4453e7c33bb0588ede222b131933aa0edb78d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e23e3bddae527b274eb1e7f033aeded35e799cc22364656c89cc476a83a3cb47"
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
