# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc 'C library for tree-sitter language pack (FFI bindings)'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  version '1.8.0-rc.42'
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.42'
    sha256 cellar: 'any_skip_relocation', arm64_linux: '71f263ef59c6260dd490a042c5fad61664192dfaad74f4e02390a6d3246f3703'
    sha256 cellar: 'any', arm64_sequoia: '921e9796f174b01f09236cd1eb58f7650cc70ee66c19ffbeac511c02f0d4c2c4'
    sha256 cellar: 'any', sequoia: 'd799b45c6093e6be6a0067b406bb350ee8de330d26c8eab42d2f34826c89c66f'
    sha256 cellar: 'any_skip_relocation', x86_64_linux: '5b3ad0fa56c5ff221e1cd6dce5a1f6094a23d33892e7d34be7a0945d47a73800'
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 'f07ec79c85a7a0b181a58bd1759a1351a04396913e5c892347f87e215b5ec37c'
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 '0808b01a76e6bc2673fa0123d1fbd233b5e0be822798c4be3a467719415c88cf'
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 '4f92ef9e953b2a7d8bd4e246593f8f186aba2d0d559da4d224de100af57afae6'
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 '14d6d8dcc13b48d748289f9cdfff8c6adeb08596af65f93410fa117bb011fdb5'
    end
  end

  def install
    include.install Dir['include/*.h']

    if OS.mac?
      lib.install Dir['lib/*.dylib']
    elsif OS.linux?
      lib.install Dir['lib/*.so']
    end
    lib.install Dir['lib/*.a']

    (lib / 'pkgconfig').install 'share/pkgconfig/tree-sitter-language-pack.pc'

    inreplace lib / 'pkgconfig/tree-sitter-language-pack.pc', /prefix=.*/, "prefix=#{prefix}"

    (lib / 'cmake/tree-sitter-language-pack').install Dir['lib/cmake/tree-sitter-language-pack/*']
  end

  test do
    (testpath / 'test.c').write <<~C
      #include <ts_pack.h>
      #include <stdio.h>
      int main(void) {
          /* Smoke: verify a known symbol resolves at link time. */
          (void) ts_pack_available_languages;
          printf("ts_pack OK\n");
          return 0;
      }
    C

    system ENV.cc, 'test.c', '-o', 'test',
           "-I#{include}", "-L#{lib}", '-lts_pack_core_ffi'
    assert_match 'ts_pack OK', shell_output('./test')
  end
end
