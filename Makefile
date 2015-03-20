top:; @date

Makefile:;

pipe  = BEGIN { m = "^\#pipe$$" }
pipe += $$1 ~ m && $$2 { $$1 = ""; p = $$0; $$0 = "" }
pipe += !p;
pipe += $$0 ~ m { close(p); p = 0 }
pipe += p { print | p }

.stone: self.yml; awk '$(pipe)' $<

main: .stone;
