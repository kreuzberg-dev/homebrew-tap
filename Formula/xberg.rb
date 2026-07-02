# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc 'High-performance document intelligence CLI'
  homepage 'https://xberg.io'
  url 'https://github.com/xberg-io/xberg/archive/v5.0.0-rc.32.tar.gz'
  sha256 '73cb59f4b5ea9e7ed5919b1d8b71add947dd5d66cc2445ac88a8c26ff18a048a'
  license 'MIT'

  bottle do
    root_url 'https://github.com/xberg-io/xberg/releases/download/v5.0.0-rc.32'
    sha256 cellar: :any, arm64_linux: '19399433781edf3c34343376161e8217e9ce4f70b962bae7c4dd6f2c7af17b66'
    sha256 cellar: :any, arm64_tahoe: '4ad5605571a94b6f8148fea188bd3cdab209b44622ac9317efb71552c44d4a08'
    sha256 cellar: :any, x86_64_linux: 'dc86df6f1f1cd2dfbf4fa51b0069909a9cddf4fdb3344de7bf86ed8e5395fa81'
  end

  head 'https://github.com/xberg-io/xberg.git', branch: 'main'

  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'rust' => :build
  depends_on 'libheif'
  depends_on 'openssl@3'
  depends_on 'tesseract'

  # Intel macOS has no static ONNX Runtime prebuilt (ort dropped x86_64-apple-darwin
  # in v2.0.0-rc.11; Microsoft dropped onnxruntime-osx-x86_64 after 1.23), so that
  # build loads ONNX Runtime dynamically from the onnxruntime formula at runtime.
  # arm64 macOS and Linux keep the statically-linked ONNX Runtime and need nothing here.
  on_macos do
    on_intel do
      depends_on 'onnxruntime'
    end
  end

  def install
    ENV['OPENSSL_DIR'] = Formula['openssl'].opt_prefix

    if OS.mac? && Hardware::CPU.intel?
      # Build with load-dynamic (no static x86_64-mac prebuilt exists) and point
      # ort at the Homebrew onnxruntime dylib via a small env wrapper, since ort
      # dlopens libonnxruntime.dylib at runtime rather than linking it.
      system 'cargo', 'install', '--features', 'api,mcp,mcp-http,ort-dynamic',
             *std_cargo_args(path: 'crates/xberg-cli')
      libexec.install bin / 'xberg'
      (bin / 'xberg').write_env_script libexec / 'xberg',
                                       ORT_DYLIB_PATH: "#{Formula['onnxruntime'].opt_lib}/libonnxruntime.dylib"
    else
      system 'cargo', 'install', '--features', 'api,mcp,mcp-http', *std_cargo_args(path: 'crates/xberg-cli')
      bin.install_symlink bin / 'xberg' => 'xberg'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xberg --version")
  end
end
