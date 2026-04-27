# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc 'Tree-sitter language pack CLI - download and manage 170+ parser grammars'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  url 'https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v1.6.2.tar.gz'
  sha256 "1c265bb83eda1b9562599f6c1ccd4ca7fd98d4a5e3f8db6efb9e2d2e78898649"
  license any_of: ['MIT', 'Apache-2.0']

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.8.0-rc.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ef0888dc42ed55701a3068e480fa901b597c5f9dc9d8541f56e9547a1cfa7df2"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/ts-pack-cli')
  end

  test do
    assert_match 'ts-pack', shell_output("#{bin}/ts-pack --help")
  end
end
