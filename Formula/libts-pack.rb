# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.8"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "70285b36c0561d013ced265462f7b495cd6a02571140a8dbf0d7de4c57d84884"
    sha256 cellar: :any, arm64_sequoia: "c61f87dd3c6c67705c5db3ca1fcd405f44360f106bad247326cc386e04ec80ab"
    sha256 cellar: :any, sequoia: "e1a478e618c42cc1ab3cb3895ddc7188bfa6dce0093f5c550f10c5e5d88c8dd2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3f5c60c44fc7f1a32f91cfcbbce7ab1d9c7a700ff1554ba5643fcc30ab2c417e"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9f9bc056d0a70bfbe532a80cc7ceb7b83d857a33c5422875774e81ce2586f2c1"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4d05835270ff83ade69886d3e39b403a8bbb572ea2fcb7a210d2ad7a3ac7a38a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7a474635785427a6c9ba0823627b0e9e04557f5c3fc5fa05bbd4034373cf17c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88c4f963bd1eb1a0aec73773f48bcef241e542c9a49a29d545afc524d73090a9"
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
          printf("ts_pack OK\n");
          return 0;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lts_pack_core_ffi"
    assert_match "ts_pack OK", shell_output("./test")
  end
end
