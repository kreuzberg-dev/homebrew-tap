# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.12"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.12"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6a60ae700db51dd23f1cc2f2ebd54459e28d44bc3846532a42899fff99116973"
    sha256 cellar: :any, arm64_sequoia: "87a6ec6d301bfd7066ef110ead585904af05790ef5c1d203122d98abd7f89202"
    sha256 cellar: :any, sequoia: "b35a32cb8fae1c9280ec1fd3f165f499607c38e0e0cb5ee851153b7f8f8636e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1b7f162b9e7967d6ca86ef79afc0da1ab1c8339e914cc44ad0a742de518cc83e"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e7a0566f6c9322835b88f51f5bf657b567f7785aca00e0114d4f257497c3bac9"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d2d6581e058b54be5f25c4fdecc296996fdf90cb897a28b0f2ae881eaa455387"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03195b979ebb0fcba789a80dd29f95f061eb04b5c21c8711f68e16855f513010"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14243c5dc15e11817bf9272bcb516f60e6b67b639292f7af3cff4b68de0a3d61"
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
