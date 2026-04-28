# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.2.tar.gz'
  sha256 "b4b952af0c53bc33025b28842766cac8c2202b996858b68b3c6fe4a913d9dc4e"
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a9d563d5b48459fc8448fa3cad71d5fb228dbb04d1faf2d9cf5f54b801825de4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e891b6e556079735605585457d4400f6dcbb7f0bde6a8bb8e1657db933736f0a"
    sha256 cellar: :any_skip_relocation, sequoia: "c8955a61b8518ca1b0baa50aa2060b3ac399c6bd14258664b8d8c2392ee25144"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9e9594afe615f34577853bce5aac9bd8eddc1b60f1f64938c2ed5d7701be9f84"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
