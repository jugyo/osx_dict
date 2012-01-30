# encoding: utf-8
require "osx_dictionary/version"
require "fileutils"
require "tmpdir"
require "erb"

module OsxDict
  class Dictionary
    attr_accessor :id, :filename, :name

    def initialize(attrs)
      attrs.each do |key, value|
        __send__(:"#{key}=", value)
      end
    end

    def entries
      @entries ||= []
    end

    def make(dest = './')
      Dir.mktmpdir do |dir|
        xml_filename   = "#{dir}/#{name}Dictionary.xml"
        plist_filename = "#{dir}/#{name}Info.plist"
        css_filename   = "#{template_dir}/Dictionary.css"

        File.open(xml_filename, 'w') do |file|
          file << to_xml
        end

        File.open(plist_filename, 'w') do |file|
          file << to_plist
        end

        Dir.chdir(dir) do
          run("/Developer/Extras/Dictionary Development Kit/bin/build_dict.sh",
              "-c=0", filename, xml_filename, css_filename, plist_filename)
        end

        FileUtils.cp_r("#{dir}/objects/#{filename}.dictionary", dest)
      end
    end

    def to_xml
      erb = ERB.new(File.read("#{template_dir}/Dictionary.xml.erb"))
      erb.result(binding)
    end

    def to_plist
      erb = ERB.new(File.read("#{template_dir}/Info.plist.erb"))
      erb.result(binding)
    end

    def run(*cmd)
      abort "command failed" unless system(*cmd)
    end

    def template_dir
      File.expand_path('../osx_dictionary', __FILE__)
    end
  end

  class Entry
    attr_accessor :id, :title, :body, :indexes

    def initialize(attrs)
      attrs.each do |key, value|
        __send__(:"#{key}=", value)
      end
    end

    def indexes
      @indexes ||= []
    end
  end
end
