default['ro-tex_ruby']['ruby_version']	= '2.2.1'
default['ro-tex_ruby']['rails_version']	= '4.2.3'

node.default['rvm']['default_ruby']       = default['ro-tex_ruby']['ruby_version']
node.default['rvm']['user_default_ruby']  = default['ro-tex_ruby']['ruby_version']
