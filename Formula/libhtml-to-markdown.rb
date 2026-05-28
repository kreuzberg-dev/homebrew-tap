# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.5"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9c5ac9e29659a10a2a6a7c663a5d49f1f028d3d7db5e469d589bed786283ffd8"
    sha256 cellar: :any, arm64_sequoia: "d5472a839fc0c978c1753b08019ac21cc2505bf1eb3dfd8cc1cede362482712b"
    sha256 cellar: :any, sequoia: "9f3bc2449873822a2212bcd4f679f66f04f045665b48d3c14cd862d1c298b9ee"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9fab92a7d38d5afc7d18bbcce11a212cce6c273c939e1f2ff0430ba198af1a13"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "527a0ef4549a641a7dd759f7941b2a8d67459c104fe08cae636fea3e8ce41e21"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "014618222b51710354ad913b8af3d60acb8cd0d1263c585361d50340e1d025aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea61bcb36b940eb92cd797d33ed1dc757cdb9d0891d0ade9a5e04c9b04b8ab79"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eff4e2030ae391ecba3eb3247a67b6767ed05cd1b7334a89950e74e692b0d248"
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
