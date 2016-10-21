name 'ruby'
description 'This is a role for all servers that need Ruby'
run_list 'recipe[ro-tex_ruby::default]'
override_attributes(
  override: {
    'ro-tex_ruby': {
      ruby_version: '2.3.1',
      rails_version: '4.2.7.1'
    }
  }
)
