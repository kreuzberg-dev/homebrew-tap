# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.11.0-rc.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.11.0-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c4afb5f41bca18ad818403dc99e88697d4df6a7b44a2786bd939ce3c2e0bd611"
    sha256 cellar: :any, arm64_sequoia: "0689a07feed1a32df8aaa48968386ae6c01155bf32f604bacc1eb530b6e8b5b8"
    sha256 cellar: :any, sequoia: "9bc89e55c19089f087301ad56cf2ff0b32a3789c8c5927eb14f6a25a7276e37d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "86498b153f80444067051efec8fbe8494bb2e8ecfbeeac26f58daa30bf36b314"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "221aa770475d3ac53cd80ced72ed9610b828c03f00c73da96a8fba7ce83c6b8b"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f26d77d93724b49a5d557d3b5dac30c5ae0e6cc2d008012b43185fe755c085e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb514c76594e8269468c9310480872da8facb738cf80a6e416f8f2db395a0de2"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "911dc58fed7686ab211b56e0cbb063c796886990eda3421556cf64b366ea5bde"
    end
  end

  def install
    include.install Dir["include/*.h"]

    if OS.mac?
      lib.install Dir["lib/*.dylib"]
    elsif OS.linux?
      lib.install Dir["lib/*.so"]
    end
    lib.install Dir["lib/*.a"]

    (lib / "pkgconfig").install "share/pkgconfig/tree-sitter-language-pack.pc"

    inreplace lib / "pkgconfig/tree-sitter-language-pack.pc", /prefix=.*/, "prefix=#{prefix}"

    (lib / "cmake/tree-sitter-language-pack").install Dir["lib/cmake/tree-sitter-language-pack/*"]
  end

  test do
    (testpath / "test.c").write <<~C
      #include <ts_pack.h>
      #include <stdio.h>
      int main(void) {
          /* Smoke: verify a known symbol resolves at link time. */
          (void) ts_pack_available_languages;
          printf("ts_pack OK\\n");
          return 0;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lts_pack_core_ffi"
    assert_match "ts_pack OK", shell_output("./test")
  end
end
