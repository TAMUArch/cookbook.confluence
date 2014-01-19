cookbook "java"
cookbook "ark", :git => "https://github.com/opscode-cookbooks/ark.git"
cookbook "database"
cookbook "postgresql"

group :integration do
  cookbook "confluence", :path => "."
  cookbook "apt"
  cookbook "yum-epel"
end
