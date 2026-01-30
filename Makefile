.PHONY: help tree

help:
	@echo "Targets:"
	@echo "  tree   - show repository structure"
	@echo "  help   - show this help"

tree:
	@python -c "import pathlib; root=pathlib.Path('.'); 	ex={'data_raw','data_intermediate','.git','__pycache__'}; 	def walk(p, pref=''): 		items=[x for x in sorted(p.iterdir(), key=lambda x:x.name) if x.name not in ex]; 		for i,x in enumerate(items): 			last=i==len(items)-1; 			print(pref + ('└── ' if last else '├── ') + x.name + ('/' if x.is_dir() else '')); 			if x.is_dir(): walk(x, pref + ('    ' if last else '│   ')); 	walk(root)"
