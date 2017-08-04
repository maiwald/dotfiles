# encoding: utf-8
# Inspired by this script of Ryan Bates: http://github.com/ryanb/dotfiles/blob/master/Rakefile
# Taken from http://github.com/tow8ie/dotfiles/blob/master/Rakefile

require 'rake'

desc "install the dot files into user’s home directory"
task :install do
  replace_all = false
  install_vim_plug
  Dir['*'].each do |filename|
    next if %w[Rakefile README.rdoc LICENSE utils].include? filename

    repo_file = File.join(ENV['PWD'], filename)
    home_file = File.join(ENV['HOME'], ".#{filename}")

    if File.exist? home_file
      if File.identical? home_file, repo_file
        puts "identical #{home_file}"
      elsif replace_all
        replace_file_with_symlink(home_file, repo_file)
      else
        print "overwrite #{home_file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file_with_symlink(home_file, repo_file)
        when 'y'
          replace_file_with_symlink(home_file, repo_file)
        when 'q'
          exit
        else
          puts "skipping #{home_file}"
        end
      end
    else
      print "create #{home_file}? [ynq] "
      case $stdin.gets.chomp
      when 'y'
        create_symlink(home_file, repo_file)
      when 'q'
        exit
      else
        puts "skipping #{home_file}"
      end
    end
  end
end

def replace_file_with_symlink(old_file, new_file)
  delete_file(old_file)
  create_symlink(old_file, new_file)
end

def delete_file(file)
  system %Q{rm -rf "#{file}"}
end

def create_symlink(pointing_file, pointed_at_file)
  puts "linking #{pointing_file} -> #{pointed_at_file}"
  system %Q{ln -s "#{pointed_at_file}" "#{pointing_file}"}
end

def install_vim_plug
  vim_plug_path = File.join(File.dirname(File.realpath(__FILE__)), 'vim/autoload/plug.vim')
  if File.exist?(vim_plug_path)
    puts "found vim-plug installation"
  else
    system %Q{curl -fLo #{vim_plug_path} --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim}
  end
end
