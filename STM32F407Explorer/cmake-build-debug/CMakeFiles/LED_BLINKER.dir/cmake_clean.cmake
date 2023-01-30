file(REMOVE_RECURSE
  "../build/meta.elf"
  "../build/meta.elf.manifest"
  "../build/meta.elf.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/LED_BLINKER.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
