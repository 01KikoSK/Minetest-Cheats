[ENABLE]
aobscanmodule(HealthAOB, minetest.exe, 89 1E 8B 4D 08 8B 55 0C) // Example AOB for health
alloc(newmem,$1000)

label(code)
label(return)

newmem:
  mov [rdi+08],#100 // Set health to 100
  jmp return

HealthAOB:
  jmp newmem
  nop
return: