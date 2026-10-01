# resume

<<<<<<< HEAD
Personal resume, composed with Press and Cascade typography.

Build with `just build`. Home Manager provides the local Typst packages
`@local/press:0.1.0` and `@local/cascade:2.0.0`, along with the matching Cascade
font cuts. The resume uses Cascade's default Inter body and Lora heading fonts.
Font Awesome 7 supplies the icons. No manual font installation or direnv setup
is needed.
=======
Personal resume, composed with Press and the shared Cascade library.

Build with `just build`. Home Manager provides `@local/press:0.1.0` and
`@local/cascade:2.0.0`. The font packages in
`~/.config/nixos/modules/home/fonts.nix` provide Quattrocento Sans, Quattrocento,
and Font Awesome 7. Run `nix-rbs` after changing that module to activate the fonts.

`formats/us/apply.typ` selects the fonts through Cascade's public `fonts` config,
including their measured x-heights, body average advance, and category-based
optical profiles. The measurements were obtained with `cascade measure` from the
Regular faces in the pinned Nix Google Fonts package. Re-measure if those font
files change. Fonts do not require a separate Cascade package or library build.
>>>>>>> d1a6b6f (Fix cascade format)

`formats/us/apply.typ` also controls composition, size, and page geometry.
`formats/us/formatter.typ` extends the Press/Cascade formatter with resume-specific
<<<<<<< HEAD
components. Font families and measured metrics come from the installed Cascade package;
changing those requires rebuilding the typography package rather than overriding only a
family name in Typst.
=======
components and spacing.
>>>>>>> d1a6b6f (Fix cascade format)
