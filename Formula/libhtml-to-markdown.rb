# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.3"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "d7d06f8327009c3e16f93ca72ed10a7db83db8dfc37edef490e97777cc01d9b3"
    sha256 cellar: :any, arm64_sequoia: "3042445411445dc5796f07fc02a426367aee92eefd29857483121ead104c0993"
    sha256 cellar: :any, sequoia: "facd1f295804208e9a7b1aa4c5789c092c757cad65916f7f2c820ad6c5b9acfa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b2e9726d802b6784a5b64cbfff40705658cd57f7aca4b7656c1cafbb521b0b31"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "81e6494d95385e6b151dc85524a3cefb419e7a7175b47f6450120fcce9060d70"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "1d619d4b0a133ecb0db38d7e80e63c055ea104741fb87e8744129b237e3447bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3e074fd93a9f553cc49ec5cdbd661981f86907f6f835fd67fe0a5372704333c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f967610ecbb7c1becd6bec1cb9480be1a75d0311793db44cadfc307c49f45781"
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
