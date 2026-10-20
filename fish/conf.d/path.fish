set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk
if test -d "$JAVA_HOME/bin"
    fish_add_path -g $JAVA_HOME/bin
end

if test -d /home/godka/.npm-global/bin
    fish_add_path -g /home/godka/.npm-global/bin
end

if test -d /home/godka/.local/share/gem/ruby/3.4.0/bin
  fish_add_path -g /home/godka/.local/share/gem/ruby/3.4.0/bin
end


