# resume

Personal resume, composed with Press and Cascade typography.

Build with `just build`. Home Manager provides the local Typst packages
`@local/press:0.1.0` and `@local/cascade:2.0.0`, along with the matching Cascade
font cuts. The resume uses Cascade's default Inter body and Lora heading fonts.
Font Awesome 7 supplies the icons. No manual font installation or direnv setup
is needed.

`formats/us/apply.typ` controls document composition, size, and page geometry.
`formats/us/formatter.typ` extends the Press/Cascade formatter with resume-specific
components. Font families and measured metrics come from the installed Cascade package;
changing those requires rebuilding the typography package rather than overriding only a
family name in Typst.
