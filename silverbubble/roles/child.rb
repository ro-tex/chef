name 'child'
description 'An example Chef role'
run_list 'recipe[rep_child]'
override_attributes(
  default: {
    rep_parent: {
      text: 'this is ROLE ROLE ROLE text'
    }
  }
)
