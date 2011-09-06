require 'test/unit'
$:.unshift(File.expand_path('../../lib',__FILE__))
$:.push(File.expand_path("../../bin",__FILE__))
require 'graphviz/version'

class GraphVizTest < Test::Unit::TestCase
  def test_version_rubygem_compatibility
    assert Gem::Version.correct?(RubyGraphViz::VERSION), "Version format does not match RubyGem requirements"
  end
  
  def test_dot2ruby_version ; check_script_version('dot2ruby', "Dot2Ruby") end
  def test_gem2gv_version ;   check_script_version('gem2gv', "Gem2Gv") end 
  def test_git2gv_version ;   check_script_version('git2gv', "Git2Gv") end
  def test_ruby2gv_version ;  check_script_version('ruby2gv', "Rb2Gv") end
  
  def test_xml2gv_version
    load File.expand_path("../../bin",__FILE__) + '/xml2gv'
    assert(GraphViz::XML::VERSION_TEXT.include?("v" + RubyGraphViz::VERSION), "xml2gv displays correct version")
  end
  
  def check_script_version(script,klass)
    load script
    assert(Object.const_get(klass)::VERSION_TEXT.include?("v" + RubyGraphViz::VERSION), "#{script} displays the correct version")
  end
end