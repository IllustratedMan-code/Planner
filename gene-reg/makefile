help: ## show this help
	@sed -ne "s/^##\(.*\)/\1/p" $(MAKEFILE_LIST)
	@printf "────────────────────────`tput bold``tput setaf 2` Make Commands `tput sgr0`────────────────────────────────\n"
	@sed -ne "/@sed/!s/\(^[^#?=]*:\).*##\(.*\)/`tput setaf 2``tput bold`\1`tput sgr0`\2/p" $(MAKEFILE_LIST)
	@printf "────────────────────────`tput bold``tput setaf 4` Make Variables `tput sgr0`───────────────────────────────\n"
	@sed -ne "/@sed/!s/\(.*\)?=\(.*\)##\(.*\)/`tput setaf 4``tput bold`\1:`tput setaf 5`\2`tput sgr0`\3/p" $(MAKEFILE_LIST)
	@printf "───────────────────────────────────────────────────────────────────────\n"

.DEFAULT_GOAL := help


output ?=build## output directory
output_prefix ?=gene-reg-midterm-david-lewis## output prefix to files in output directory

exam: chen.typ edsall.typ roskin.typ  weirauch.pptx roskin-analysis.r chen.r## make exam in the output directory
	mkdir -p ${output}
	typst compile chen.typ  ${output}/${output_prefix}-chen.pdf
	typst compile edsall.typ  ${output}/${output_prefix}-edsall.pdf
	typst compile roskin.typ  ${output}/${output_prefix}-roskin.pdf
	cp chen.r ${output}/${output_prefix}-chen.r
	cp roskin-analysis.r ${output}/${output_prefix}-roskin.r
	cp weirauch.pptx  ${output}/${output_prefix}-weirauch.pptx

clean: 
	rm -rf ${output}

zip_exam: ${output}
	zip -r ${output_prefix}.zip ${output}
