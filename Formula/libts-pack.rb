# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.51"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.51"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9ffa38c618e0b7ecba7aca48d4a48ee302f6862f08a4a1ef5b5d4ac8e2df1c85"
    sha256 cellar: :any, arm64_sequoia: "74ba711eb1babe82755abb0e9862905a2a68c6d4beae1f6618693963ab00c67d"
    sha256 cellar: :any, sequoia: "a8ee9f3bdbafedac4e93037bbe25ee73464f1d35194f4475f2e91d578f1ee918"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e2ab35cbd7e0e5fa830fbaa987ea5e8cd8b015f8d32a508ab41412b60a9fe31d"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8b9d385ceec13b174edb9f12d5f8941220107518b8120dccabb0b1888a2f78a4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7c2a73ae8d18e335233d4d2549804c843b0fb0edf4020b853e1bbaf1e1f89cba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "049db075ca29fecc0fe39fbb8b270bb392a382eaf4a39aa992810ec05a48f4ae"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08235dbbbc3c4e4b0162b0023c8bb95fd548a5989c11eae3d96fbd60ccce477e"
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
