class SouffleAT16 < Formula
  desc "Translator of declarative Datalog programs into the C++ language."
  homepage "https://github.com/souffle-lang/souffle/wiki"
  stable do
    url "https://github.com/souffle-lang/souffle/archive/refs/tags/1.6.2.tar.gz"
    sha256 "997945c771f628c5c2495f224f7f1188760ad8c386e74dae4808d2318eabd57e"
  end
  head "https://github.com/souffle-lang/souffle.git", :shallow => false

  depends_on "libtool" => :build
  depends_on "bison" => [:build, "3.0.2"]
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
