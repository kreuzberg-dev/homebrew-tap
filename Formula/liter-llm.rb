# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.7.4.tar.gz"
  sha256 "200fa851dbe054a83db1c5c517d883d5bf9566713e195bf8762121757a6c6323"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.7.4"
    sha256 cellar: :any, arm64_linux: "662488d99041731061ccd25d609d3b347b68ee196e011b8aa70a29952043858f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c8e9941cea1ea1b6ea2978aaa7ce0bbc215ce0e1fdf46ac07daeeb9ea081a642"
    sha256 cellar: :any_skip_relocation, sequoia: "ad6bbfe5d73b8a0086a26fb8877a08a574b7fdaf3543e94d230ac8ce8324b604"
    sha256 cellar: :any, x86_64_linux: "a326d70d127edb2e7b911f4a96c25da22acdc6893170ab2237f4a70c3137f513"
  end

  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
