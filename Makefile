top:; @date

Makefile:;

pipe := BEGIN { m = "^\#pipe$$" }
pipe += $$1 ~ m && $$2 { $$1 = ""; p = $$0; printf "" | p; next }
pipe += !p { if (show) print }
pipe += $$0 ~ m { close(p); p = 0 }
pipe += p { print | p }

.stone: bashrc-role.yml; awk '$(pipe)' $<

main: .stone;
