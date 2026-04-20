# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.2.tar.gz'
  sha256 'e178aaa6d857033aa19e8b4209d1dbfa577196a86faf64e4ebc32ae58dcb732a'
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.6.2'
    sha256 cellar: :any_skip_relocation,
           arm64_sequoia: '007e5c923bdd584f470d372a6999eea9daf664711cc9a38bf221ccdb484d24cc'
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
