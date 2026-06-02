# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.3"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "50da02b84b1713ca189a613cebd215fadc798c6dc87cca37739a67dc070437bb"
    sha256 cellar: :any, arm64_sequoia: "667337c6348173b433bc5c83cd5921cdcc53c34ab03273edffe62a7c789779cb"
    sha256 cellar: :any, sequoia: "87f148d748f311156786e3cc12618ee9b252d46bcc010ff320eccc2e2a6cb1e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d8a5f53e5251c2fa492bf8c716cda41b90fa37b7db7e6d9e564a5f7b4569c854"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8b31a2b80b9627b8094ba37c195085ea4e419714a4c90daccd6b7a459a8c06a8"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cd1bd046bda0a2d9f1cb49d201cb06070e338767f5612dd800f9c642d4075365"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ccabcd9a1440be1556411ee2eaae256fb1f95d1fb9ffe89076966f0618688874"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78de42d6398ebbfd7152ee6ea0dba7d04708b1e328be79ea6d8707f7781ef92c"
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
