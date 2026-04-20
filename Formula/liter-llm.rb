# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'OpenAI-compatible LLM proxy server and MCP tool server'
  homepage 'https://kreuzberg.dev'
  url 'https://github.com/kreuzberg-dev/liter-llm/archive/v1.2.2.tar.gz'
  sha256 'PLACEHOLDER'
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  bottle do
    root_url 'https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.2.2'
    sha256 cellar: :any_skip_relocation,
           arm64_sequoia: 'c7243f85ae96c33a24f926522c81552ed10ecef88c360295cafc947fdf7fc7cb'
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
