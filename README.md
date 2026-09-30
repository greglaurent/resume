# resume

Personal resume, composed with Press and a Cascade typography profile.

Build with `just build`. The local Typst packages are provided by Home Manager:
`@local/press:0.1.0` and `@local/resume-typography:2.0.0`.

The profile is built in `~/.config/nixos/modules/home/fonts.nix` from the pinned
Quattrocento Sans and Quattrocento font files. Nix installs both the original
families and the matching Cascade font cuts, along with Font Awesome 7. Run the
normal Nix rebuild (`nix-rbs`) after changing that module to activate the fonts
and local package. No manual font installation or direnv setup is needed.

`formats/us/apply.typ` controls document composition, size, and page geometry.
`formats/us/formatter.typ` extends the Press/Cascade formatter with resume-specific
components. Font families and measured metrics come from the generated profile;
changing those requires rebuilding the profile rather than overriding only a
family name in Typst.
