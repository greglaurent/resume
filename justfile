# Resume — compile helpers.

# Default recipe: list recipes.
default:
    @just --list

# Compile the resume. Positional args: format, filename, output.
#   just build                              # output/Gregory_Laurent_us.pdf
#   just build cv                           # output/Gregory_Laurent_cv.pdf
#   just build us resume                    # output/resume_us.pdf
#   just build us Gregory_Laurent builds    # builds/Gregory_Laurent_us.pdf
#   just build output=builds                # named-arg shortcut for changing just one
build format="us" filename="Gregory_Laurent" output="output":
    mkdir -p {{ output }}
    typst compile --input format={{ format }} --input file-name={{ filename }} --input output={{ output }} main.typ {{ output }}/{{ filename }}_{{ format }}.pdf
