class SouffleAT17 < Formula
  desc "Translator of declarative Datalog programs into the C++ language."
  homepage "https://github.com/souffle-lang/souffle/wiki"
  stable do
    url "https://github.com/souffle-lang/souffle/archive/refs/tags/1.7.1.tar.gz"
    sha256 "80cf131a7463820d39fed97d43fcf0dde51b9b36cb65a3f5f646d999aeafda32"
  end
  head "https://github.com/souffle-lang/souffle.git", :shallow => false

  depends_on "libtool" => :build
  depends_on "bison" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libffi" => :build
  depends_on "mcpp"
  depends_on "pkg-config" => :build

  def install
    if build.head?
      system "git", "fetch", "--tags"
    end

    system "sed", "-i'.bak'", "-e", "/AC_CONFIG_MACRO_DIR(/d", "configure.ac"
    system "./bootstrap"

    system "./configure", "--prefix=#{prefix}"
    system "make -j"
    system "make", "install"
  end

  test do
    system "false"
  end
end
