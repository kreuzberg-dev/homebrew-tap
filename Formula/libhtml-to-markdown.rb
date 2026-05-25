# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a650614f85bc6cf5b1cb31d8b4edd13af00966293dc0f8f7bdccc1fdf60d9580"
    sha256 cellar: :any, arm64_sequoia: "f7ad85ec02862ffde018c9a0c0d3a95a5ded6d5fed8a0760e54d5b56930b3e72"
    sha256 cellar: :any, sequoia: "4fb8342e6c703bcc22fcad93ec35843cda60f86a3c3c7b38c032755825e1b13b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e33548f2336848aec447bc81c3ef8015f6388c38c4f9d0ad14ba2d1f50d625fe"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7e7eaa89dd6fe306efd7fb966ba7bc2cbfe383c5e6e845cf12fc6e8a06256432"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9ad3d153d7c356c5ae037b115eb7a271de766cf775b2e624f2843f9757dea50a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee985170f68ec91add3136b827d90d992ae93d396af39357e9e72c6b76c6d516"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbdb341ee43055bb2b57a8bf6c65a51bae4d9aab16cac7e99d5995e9500d03c5"
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
