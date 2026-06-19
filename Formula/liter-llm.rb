# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.7.3.tar.gz"
  sha256 "938e8cbe933551f2667b49cc08b898831eadc94bda5dc062731a49c8bd231d4f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.7.3"
    sha256 cellar: :any, arm64_linux: "cf8354110ae40e94e840322198d89e9b99e025ab55b031c9ed865ba29d7a8ec3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c4082b1a36b9458064a77d6e21d4c39f519bef39e64a46ff06668b1d356181da"
    sha256 cellar: :any_skip_relocation, sequoia: "fe48bd7f2c5d737058648d989325a1e18ac9228d0d3e5bb4eeced202c61ca258"
    sha256 cellar: :any, x86_64_linux: "29846af32c58983a7904c4df1b28ade50577b2dd2f2017093b9309b7d0b3baf9"
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
