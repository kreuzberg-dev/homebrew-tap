# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.18"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.18"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1570fcdd4180c5a8b4d0b861a5edb6189f32392eb9fcbf35ecba5c5e22fc3a20"
    sha256 cellar: :any, arm64_sequoia: "b2d3d96895fbf92b9999a375ef5aab93866dd1a75166bd0ff0dfbdae0b2b9f75"
    sha256 cellar: :any, sequoia: "9fe1224e1d6e8d8b9b6894410672043c7bf77f17e3e09afb58efb669c480487c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2c541ef18b5710aed7603324f2f7ec115b01827342a24fe39444b7e8bb73243e"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8423d903b04beab15d583c9329f37409774770ebd7c27fa3fa296208d2c8c862"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "beadcfda3e00abc2ad8f1e2e3f7cfe21e05df9b1c4c5e6f908e0e340a133c391"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa36e42f6a99ab348cee84039c11d1b040a1956cca310fa77ee590f54f35382b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6455882a2cfd286de91fde9eabdea17a4a9e442c3fd52d8bb254092e85cfbebb"
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
